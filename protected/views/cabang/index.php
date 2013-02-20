<?php
$this->breadcrumbs=array(
	Yii::t('ui','Branch'),
);


$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
		array('label'=>Yii::t('ui','Create ').Yii::t('ui','Branch'), 'url'=>array('create')),
    ),
));
$cs=Yii::app()->clientScript;

$cs->registerScript('search', "
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

<h1><?php echo Yii::t('ui','Manage '). Yii::t('ui','Branchs'); ?></h1>

<?php //echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>

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
		// 'id',
		'nama',
		'description',
		'alamat',
		array(
			'name'=>'parent_id',
			'value'=>'$data->parent->nama',
			'filter'=>Cabang::model()->getParentDropdown(),
		),
		array(
			'name'=>'last_visit',
			// 'value'=>'date("m/d/Y ", $data->last_visit)',
			'value'=>'date("j F, Y ", strtotime($data->last_visit))',
			),
		array(
			'class'=>'CButtonColumn',
		),	
	),
));
?>
<?php
	$this->beginWidget('zii.widgets.CPortlet', array(
			'title'=>Yii::t('ui','Recent CPU Licenses'),
		));
		$this->widget('RecentLicenses', array('mesinId'=>$model->id));
		$this->endWidget(); 
?>
