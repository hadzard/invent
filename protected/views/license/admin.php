<?php
$this->breadcrumbs=array(
	'Licenses'=>array('index'),
	'Manage',
);


$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
		array('label'=>'List License', 'url'=>array('index')),
		array('label'=>'Create License', 'url'=>array('create')),

    ),
));

// $this->menu=array(
	// array('label'=>'List License', 'url'=>array('index')),
	// array('label'=>'Create License', 'url'=>array('create')),
// );

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('license-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Licenses</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'license-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'Description',
		'coa',
		'jenis',
		'mesin_id',
		'create_time',
		/*
		'create_user_id',
		'update_time',
		'update_user_id',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
