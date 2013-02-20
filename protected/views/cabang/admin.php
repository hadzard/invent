<?php
$this->breadcrumbs=array(
	'Cabangs'=>array('index'),
	'Manage',
);

$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
		array('label'=>'List Cabang', 'url'=>array('index')),
		array('label'=>'Create Cabang', 'url'=>array('create'), 'visible'=>Yii::app()->user->getLevel()<=2),
	),
));
// $this->menu=array(
	// array('label'=>'List Cabang', 'url'=>array('index')),
	// array('label'=>'Create Cabang', 'url'=>array('create'), 'visible'=>Yii::app()->user->getLevel()<=2),
// );

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('cabang-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Branchs</h1>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'cabang-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'nama',
		'description',
		'alamat',
		'last_visit',
		'create_time',
		'create_user_id',
		/*
		'update_time',
		'update_user_id',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
