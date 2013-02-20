<?php
$this->breadcrumbs=array(
	Yii::t('ui','PC User')=>array('index'),
	$model->user=>array('view','user'=>$model->user),
	'Update',
);


$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
		array('label'=>Yii::t('ui','List ').Yii::t('ui','PC User'), 'url'=>array('index')),
		array('label'=>Yii::t('ui','Create ').Yii::t('ui','PC User'), 'url'=>array('create')),
		array('label'=>Yii::t('ui','View ').Yii::t('ui','PC User'), 'url'=>array('view', 'id'=>$model->id)),
	
    ),
));

?>

<h1><?php echo Yii::t('ui','Update ').' '. Yii::t('ui','PC User').' '.  $model->user; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>