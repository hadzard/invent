<?php
$this->breadcrumbs=array(
	Yii::t('ui','Users') =>array('index'),
	$model->username=>array('view','username'=>$model->username),
	Yii::t('ui','Update '),
);

$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
		array('label'=>Yii::t('ui','List '). Yii::t('ui','User'), 'url'=>array('index')),
		array('label'=>Yii::t('ui','Create '). Yii::t('ui','User'), 'url'=>array('create'), 'visible'=>Yii::app()->user->getLevel()<=1),
		array('label'=>Yii::t('ui','View ').Yii::t('ui','User'), 'url'=>array('view', 'id'=>$model->id)),
	),
));
?>

<h1><?php echo Yii::t('ui','Update ').Yii::t('ui','User') ;?> <?php echo $model->username; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>