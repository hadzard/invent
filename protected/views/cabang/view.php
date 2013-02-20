<?php
$this->breadcrumbs=array(
	Yii::t('ui','Branch')=>array('index'),
	$model->description,
);


$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
			array('label'=>Yii::t('ui','List ').Yii::t('ui','Branch'), 'url'=>array('index')),
			array('label'=>Yii::t('ui','Create ').Yii::t('ui','Branch'), 'url'=>array('create'), 'visible'=>Yii::app()->user->getLevel()<=1),
			array('label'=>Yii::t('ui','Update ').Yii::t('ui','Branch'), 'url'=>array('update', 'id'=>$model->id)),
			array('label'=>Yii::t('ui','Delete ').Yii::t('ui','Branch'), 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>Yii::t('zii','Are you sure you want to delete this item?')), 'visible'=>Yii::app()->user->getLevel()<=2),
    ),
));
?>

<h1><?php echo Yii::t('ui','View ').Yii::t('ui','Branch'); ?> <?php echo $model->description; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'nama',
		'description',
		'alamat',
		array(
			'name'=>parent_id,
			'value'=>$model->parent->nama,
		),
		'last_visit',
	),
)); ?>

<?php $this->beginWidget('zii.widgets.CPortlet', array(
		'title'=>Yii::t('ui','Recent CPU Licenses'),
	));
	$this->widget('RecentLicenses', array('mesinId'=>$model->id));
	$this->endWidget(); 
?>