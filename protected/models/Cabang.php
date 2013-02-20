<?php

/**
 * This is the model class for table "tbl_cabang".
 *
 * The followings are the available columns in table 'tbl_cabang':
 * @property integer $id
 * @property string $nama
 * @property string $nama
 * @property string $description
 * @property integer $parent_id
 * @property string $last_visit
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property User[] $tblUsers
 */
class Cabang extends ModelBase
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Cabang the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_cabang';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nama, alamat', 'required'),
			array('parent_id', 'numerical', 'integerOnly'=>true),
			array('nama, description, alamat', 'length', 'max'=>128),
			array('last_visit, create_time, update_time', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nama, alamat, last_visit, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'tblUsers' => array(self::MANY_MANY, 'User', 'tbl_cabang_user_assignment(cabang_id, user_id)'),
			// Parent relation
			'parent' => array(self::BELONGS_TO, 'Cabang', 'parent_id'),
			'children' => array(self::HAS_MANY, 'Cabang', 'parent_id'),
			'childCount' => array(self::STAT, 'Cabang', 'parent_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nama' => Yii::t('ui','Name'),
			'description' => Yii::t('ui','Description'),
			'alamat' => Yii::t('ui','Address'),
			'parent_id' => Yii::t('ui','Parent Office'),
			'last_visit' => Yii::t('ui','Last Visit'),
			'create_time' => 'Create Time',
			'create_user_id' => 'Create User',
			'update_time' => 'Update Time',
			'update_user_id' => 'Update User',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('Name',$this->nama,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('Address',$this->alamat,true);
		$criteria->compare('parent_id',$this->parent_id);
		$criteria->compare('last_visit',$this->last_visit,true);
		$criteria->compare('create_time',$this->create_time,true);
		$criteria->compare('create_user_id',$this->create_user_id);
		$criteria->compare('update_time',$this->update_time,true);
		$criteria->compare('update_user_id',$this->update_user_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
	
	/**
	* creates an association between the project, the user and the
	user's role within the project
	*/
	public function associateUserToRole($role,$userId)
	{
		$sql = "INSERT INTO tbl_cabang_user_role (cabang_id, user_id,role) VALUES (:cabangId, :userId, :role)";
		$command = Yii::app()->db->createCommand($sql);
		$command->bindValue(":cabangId", $this->id, PDO::PARAM_INT);
		$command->bindValue(":userId", $userId, PDO::PARAM_INT);
		$command->bindValue(":role", $role, PDO::PARAM_STR);
		return $command->execute();
	}
	
	/**
	* creates an association between the project, the user and the
	user's role within the project
	*/
	public function removeUserFromRole($role,$userId)
	{
		$sql = "DELETE FROM tbl_cabang_user_role WHERE cabang_id=:cabangId AND user_id=:userId AND role=:role";
		$command = Yii::app()->db->createCommand($sql);
		$command->bindValue(":cabangId", $this->id, PDO::PARAM_INT);
		$command->bindValue(":userId", $userId, PDO::PARAM_INT);
		$command->bindValue(":role", $role, PDO::PARAM_STR);
		return $command->execute();
	}
	
	/**
	* @return boolean whether or not the current user is in the
	specified role within the context of this project
	*/
	public function isUserInRole($role)
	{
		$sql = "SELECT role FROM tbl_cabang_user_role WHERE cabang_id=:cabangId AND user_id=:userId AND role=:role";
		
		$command = Yii::app()->db->createCommand($sql);
		$command->bindValue(":cabangId", $this->id, PDO::PARAM_INT);
		$command->bindValue(":userId", Yii::app()->user->getId(),PDO::PARAM_INT);
		$command->bindValue(":role", $role, PDO::PARAM_STR);
		return $command->execute()==1 ? true : false;
	}
	
	// to make dropdown parent office
	public function getParentDropdown()
	{
		$Criteria = new CDbCriteria();
		$Criteria->condition = 'nama LIKE "FB%"';
		
		$parent = $this->findAll($Criteria)	;
		
		$branchOptions = CHtml::listData($parent,'id','nama');
		return $branchOptions;
	}
	
	/**
	 * @return string tree label for tree view in search
	 */
	public function getTreeLabel()
	{
		// $cabang = new Cabang;
		return $this ->description . ' : ' .$this ->childCount;
	}
	
	/**
	 * @return array menu url
	 */
	public function getMenuUrl()
	{
		if(Yii::app()->controller->action->id=='adminMenu')
			return array('admin', 'id'=>$this->id);
		else
			return array('index', 'id'=>$this->id);
	}
	
	/**
	 * @return array behaviors. for tree view in search
	 */
	public function behaviors()
	{
		return array(
			'TreeBehavior' => array(
				'class' => 'ext.behaviors.XTreeBehavior',
				'treeLabelMethod'=> 'getTreeLabel',
				'menuUrlMethod'=> 'getMenuUrl',
			),
		);
	}
	
	
	// validation before save for pusat
	public function beforeSave()
	{
		if(parent::beforeSave())
		{
			if($this->id == 5)
			{
				$this->parent_id = 0;
			}
			else
			{
				$this->parent_id = $this->parent_id;
			}
		}
		return true;
	}
}