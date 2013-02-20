<?php
$this->breadcrumbs=array(
	'Cases'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List Cases', 'url'=>array('index')),
	array('label'=>'Create Cases', 'url'=>array('create')),
	array('label'=>'Update Cases', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Cases', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Cases', 'url'=>array('admin')),
);
?>

<h1>View Cases #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'case_date',
		'description',
		'solving',
		'mesin_id',
		'create_time',
		'create_user_id',
		'update_time',
		'update_user_id',
	),
)); ?>
