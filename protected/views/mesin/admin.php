<?php
$this->breadcrumbs=array(
	Yii::t('ui','PC User')=>array('index'),
	Yii::t('ui','Manage '),
);


$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
		array('label'=>Yii::t('ui','Create ').Yii::t('ui','PC User'), 'url'=>array('create')),
    ),
));

$cs=Yii::app()->clientScript;

$cs->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('mesin-grid', {
		data: $(this).serialize()
	});
	return false;
});
");

$cs->registerScript('menuTreeClick', "
	jQuery('#menu-treeview a').click(function() {
		$('#Mesin_cabang_id').val(this.id);
		$.fn.yiiGridView.update('mesin-grid', {
		data: $('.search-form form').serialize()
	});
	return false;
	});
");


$cs->registerScript('clearSelection', "
	jQuery('#clearSelection').click(function() {
		$('#Mesin_cabang_id').val();
		$.fn.yiiGridView.update('mesin-grid', {
		data: $('.search-form form').serialize()
	});
	return false;
	});
");
?>

<h1><?php echo Yii::t('ui','Manage ').Yii::t('ui','User PC'); ?></h1>


<div id="treecontrol">
	<a href="#"><?php echo Yii::t('ui','Collapse All');?></a> |
	<a href="#"><?php echo Yii::t('ui','Expand All');?></a>
</div>
<?php 
?>
<?php
	
echo CHtml::link(Yii::t('ui','Show All PC'),array("id"=>"clearSelection"));

$this->widget('CTreeView',array(
    'id'=>'menu-treeview',
    'data'=>Cabang::model()->getTreeItems(),
    'control'=>'#treecontrol',
    'animated'=>'fast',
    'collapsed'=>true,
    'htmlOptions'=>array(
        'class'=>'filetree'
    )
));

?>

<?php //echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>

</div><!-- search-form -->

<?php echo CHtml::beginForm(array('mesin/export')); ?>
<?php
 $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'mesin-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
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
		array(
			'class'=>'CButtonColumn',
		),
	),
)); 
?>
<?php	echo CHtml::submitButton(Yii::t('ui','Export To Excel')); 
	echo CHtml::endForm();
?> 		
