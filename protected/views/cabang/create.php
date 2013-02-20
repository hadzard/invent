<?php
$this->breadcrumbs=array(
	Yii::t('ui','Branch')=>array('index'),
	Yii::t('ui','Create '),
);

$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
		array('label'=>Yii::t('ui','List ').Yii::t('ui','Branch'), 'url'=>array('index')),
	),
));
?>

<h1><?php echo Yii::t('ui','Create '). Yii::t('ui','Branch') ;?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>