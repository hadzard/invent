<?php
$this->breadcrumbs=array(
	'Licenses'=>array('index'),
	$model->id,
);


$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
			array('label'=>'List License', 'url'=>array('index')),
		array('label'=>'Create License', 'url'=>array('create')),
		array('label'=>'Update License', 'url'=>array('update', 'id'=>$model->id)),
		array('label'=>'Delete License', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
    ),
));

// $this->menu=array(
	// array('label'=>'List License', 'url'=>array('index')),
	// array('label'=>'Create License', 'url'=>array('create')),
	// array('label'=>'Update License', 'url'=>array('update', 'id'=>$model->id)),
	// array('label'=>'Delete License', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	// array('label'=>'Manage License', 'url'=>array('admin')),
// );
?>

<h1>View License #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'Description',
		'coa',
		'jenis',
		'mesin_id',
		'create_time',
		'create_user_id',
		'update_time',
		'update_user_id',
	),
)); ?>
