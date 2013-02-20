<?php
$this->breadcrumbs=array(
	Yii::t('ui','Users')=>array('index'),
	$model->username,
);

$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
		array('label'=>Yii::t('ui','List ').Yii::t('ui','User'), 'url'=>array('index')),
		array('label'=>Yii::t('ui','Create ').Yii::t('ui','User'), 'url'=>array('create'), 'visible'=>Yii::app()->user->getLevel()<=1),
		array('label'=>Yii::t('ui','Update ').Yii::t('ui','User'), 'url'=>array('update', 'id'=>$model->id)),
		array('label'=>Yii::t('ui','Delete ').Yii::t('ui','User'), 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>Yii::t('ui','Are you sure you want to delete this item?'))),
	),
));

?>

<h1><?php echo Yii::t('ui','View ').Yii::t('ui','User'); ?> <?php echo $model->username; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'email',
		'username',
		array(
			'name'=>'level',
			'value'=>CHtml::encode($model->getLevelText())
		),
		'last_login_time',
	),
)); ?>
