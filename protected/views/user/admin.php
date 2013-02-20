<?php
$this->breadcrumbs=array(
	Yii::t('ui','Users')=>array('index'),
	Yii::t('ui','Manage '),
);

$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
		array('label'=>Yii::t('ui','List '). Yii::t('ui','User'), 'url'=>array('index')),
		array('label'=>Yii::t('ui','Create ').Yii::t('ui','User'), 'url'=>array('create'), 'visible'=>Yii::app()->user->getLevel()<=1),
		array('label'=>Yii::t('ui','Update ').Yii::t('ui','My User'), 'url'=>array('update', 'id'=>Yii::app()->user->id), 'visible'=>Yii::app()->user->getLevel()<=1),	),
));

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('user-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1><?php echo Yii::t('ui','Manage ').Yii::t('ui','Users'); ?></h1>


<?php //echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'user-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'username',
		'email',
		array(
			'name'=>'last_login_time',
			'value'=>'date("j F, Y \a\t h:i a", strtotime($data->last_login_time))',
		),
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
