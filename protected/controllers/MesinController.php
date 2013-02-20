<?php

class MesinController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';

	/**
	 * @var CActiveRecord the currently loaded data model instance.
	 */
	private $_model;
	
	/**
	* @var private property containing the associated Cabang model	instance.
	* ini object cabang
	*/
	// private $_cabang = null;
	
	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		//	'cabangContext + create', // check to ensure valid project context
		);
	}
	
	/**
	* Protected method to load the associated Project model class
	* @project_id the primary identifier of the associated Project
	* @return object the Project data model based on the primary key
	*/
	/**protected function loadCabang($cabang_id) 
	{
		//if the project property is null, create it based on input id
		if($this->_cabang===null)
		{
			$this->_cabang=Cabang::model()->findbyPk($cabang_id);
			if($this->_cabang===null)
			{
				throw new CHttpException(404,'The requested project does not exist.');
			}
		}
		return $this->_cabang;
	}
	
	public function filterCabangContext($filterChain)
	{
		//set the project identifier based on either the GET or POST input
		//request variables, since we allow both types for our actions
		$cabangId = null;
		if(isset($_GET['pid']))
			$cabangId = $_GET['pid'];
		else
			if(isset($_POST['pid']))
				$cabangId = $_POST['pid'];
		
		$this->loadCabang($cabangId);
		//complete the running of other filters and execute the	requested action
		$filterChain->run();
	}
	**/
	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','view','Export','DownloadSiw','fillTree'),
				'users'=>array('@'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update'),
				'expression'=>'$user->getLevel()<=2', //'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'expression'=>'$user->getLevel()<=2', //'users'=>array('@'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView()
	{
		$mesin = $this->loadModel(true);
		$license = $this->addLicense($mesin);
		
		$mesin->makeDir(Yii::app()->basePath .'/process/', $mesin->id);
		
		$this->render('view',array(
			'model'=>$mesin,
			'license'=>$license,
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Mesin;
		
		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model);
		
		if(isset($_POST['Mesin']))
		{
			$model->attributes=$_POST['Mesin'];

				if(isset($_FILES['files']))
				{
					
					//upload new files
					foreach($_FILES['files']['name'] as $key=>$filename)
						move_uploaded_file($_FILES['files']['tmp_name'][$key],Yii::app()->params['uploadDir'].$filename);
							
					// adding attriibutes from file name
					$model->file_name = $filename;
					if (strlen($model->file_name) > 1 && $model->validateFileName($model->file_name))
					{							
						$model->saveFromFilename();
					}
				}
		
			if((!$model->hasErrors()) && $model->save())
				$this->redirect(array('view','id'=>$model->id));
	
		}
				
		$this->render('create',array(
			'model'=>$model,
		));
	}
	
	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel();

		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model);

		if(isset($_POST['Mesin']))
		{
			$model->attributes=$_POST['Mesin'];
			// if update using upload files
			if(isset($_FILES['files']))
			{
				//upload new files
				foreach($_FILES['files']['name'] as $key=>$filename)
					move_uploaded_file($_FILES['files']['tmp_name'][$key],Yii::app()->params['uploadDir'].$filename);
				
				// adding attriibutes from file name
				$model->file_name = $filename;
				if (strlen($model->file_name) > 1 && $model->validateFileName($model->file_name))
				{							
					$model->saveFromFilename();
				}
			}
			
			if((!$model->hasErrors()) && $model->save())
				$this->redirect(array('view','id'=>$model->id));
		}
		
		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			$this->loadModel()->delete();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
		}
		else
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$model=new Mesin('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Mesin']))
			$model->attributes=$_GET['Mesin'];
		
		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Mesin('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Mesin']))
			$model->attributes=$_GET['Mesin'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 */
	public function loadModel($withComments=false)
	{
		if($this->_model===null)
		{
			if(isset($_GET['id']))
			{
				if($withComments)
			    {
					$this->_model=Mesin::model()->with(array(
					                     'licenses'=>array('with'=>'mesin')))->findbyPk($_GET['id']);
				}
			    else
			    {
				    $this->_model=Mesin::model()->findbyPk($_GET['id']);
			    }
			}
			if($this->_model===null)
				throw new CHttpException(404,'The requested page does not exist.');
		}
		return $this->_model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='mesin-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
		
	// add License	to create license object for rendering in view
	protected function addLicense($mesin)
	{
		$license = new License;
		if(isset($_POST['License']))
		{
			$license->attributes=$_POST['License'];
			if($mesin->addLicense($license))
			{
				Yii::app()->user->setFlash('licenseSubmitted',"Your License has been added." );
				$this->refresh();
			}
		}
		return $license;
	}
	
	/**
	 * @return array filename
	 */
	public function findFiles($id)
	{
		return array_diff(scandir(Yii::app()->basePath .'/process/'.$id.'/'), array('.', '..'));
	}
	
	public function actionExport()
	{
		$model = new Mesin();
		$model->attributes = $_POST['Mesin'];
		
		$this->widget('ext.EExcelView.EExcelView', array(
				'title' => 'Data PC Cabang',
				'dataProvider' => $model->search(),
				'filter' => $model,
				'grid_mode'=>'export',
				'columns' => array(
					'barcode',
					'user',
					'divisi',
					array(
						'name'=>'jenis',
						'value'=>'$data->getJenisText()',
						'filter'=>Mesin::model()->getJenisOptions(),
					),
					'ram',
					'hdd',
					'ip',
					'file_name',
					'os',
					'office',
					'label_coa',
					array(
						'name'=>'cabang_id',
						'value'=>'$data->cabangs->nama',
						'filter'=>Mesin::model()->getCabangOptions(),
					),
					array(
						'name'=>'license',
						'value'=>'$data->getAllLicenses()',
					),
				),
			)
		);
	}

	public function actionDownloadSiw($id,$filename)
	{ 
		// $material = Materials::model()->findByPk($id);
		$src = Yii::app()->basePath .'/process/'.$id.'/'.$filename;
		if(@file_exists($src)) 
		{
			$path_parts = @pathinfo($src);
			//$mime = $this->__get_mime($path_parts['extension']);
			header('Content-Description: File Transfer');
			header('Content-Type: application/octet-stream');
			//header('Content-Type: '.$mime);
			header('Content-Disposition: attachment; filename='.basename($src));
			header('Content-Transfer-Encoding: binary');
			header('Expires: 0');
			header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
			header('Pragma: public');
			header('Content-Length: ' . filesize($src));
			ob_clean();
			flush();
			readfile($src);
		} 
		else 
		{
			header("HTTP/1.0 404 Not Found");
			exit();
		}
	}
}