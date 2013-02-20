<?php
$this->breadcrumbs=array(
	Yii::t('ui','Branch')=>array('index'),
	$model->description=>array('view','description'=>$model->description),
	Yii::t('ui','Update '),
);

$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
			array('label'=>Yii::t('ui','List ').Yii::t('ui','Branch'), 'url'=>array('index')),
			array('label'=>Yii::t('ui','Create ').Yii::t('ui','Branch'), 'url'=>array('create'), 'visible'=>Yii::app()->user->getLevel()<=1),
			array('label'=>Yii::t('ui','View ').Yii::t('ui','Branch'), 'url'=>array('view', 'id'=>$model->id)),
	),
));

?>

<h1><?php echo Yii::t('ui','Update ').Yii::t('ui','Branch');?> <?php echo $model->description; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>