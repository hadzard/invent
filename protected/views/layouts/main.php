<?php
if(!Yii::app()->request->isAjaxRequest)
{
	$cs=Yii::app()->clientScript;
	$cs->registerCoreScript('jquery');
	$cs->registerCoreScript('yii');
	$cs->registerScriptFile(XHtml::jsUrl('common.js'), CClientScript::POS_HEAD);
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />

	<?php echo Yii::app()->bootstrap->registerBootstrap(); ?>
	
	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>

<div class="container" id="page">

	<div id="header">
		<div id="logo"><?php echo CHtml::encode(Yii::app()->name); ?></div>
	</div><!-- header -->

	<div id="menubar">
			<?php $this->widget('ext.components.language.XLangMenu', array(
				'encodeLabel'=>false,
				'items'=>array(
					'id'=>XHtml::imageLabel('ie.png','Indonesia'),
					'en'=>XHtml::imageLabel('en.png','In English')
				),
			)); ?>
	</div><!-- menubar -->

	
	<div id="mainmenu">
		<?php $this->widget('ext.mbmenu.MbMenu',array(
		//$this->widget('zii.widgets.CMenu',array(
			'items'=>array(
				array('label'=>Yii::t('ui','Branch'), 'url'=>array('/cabang'), 'visible'=>Yii::app()->user->getLevel()<=1),
				array('label'=>Yii::t('ui','PC Users'), 'url'=>array('/mesin'), 'visible'=>!Yii::app()->user->isGuest),
				array('label'=>Yii::t('ui','Member'), 'url'=>array('/user'), 'visible'=>Yii::app()->user->getLevel()<=1),
				array('label'=>Yii::t('ui','Member'), 'url'=>array('/user/update&id='.Yii::app()->user->id), 'visible'=>Yii::app()->user->getLevel()==2),
				array('label'=>Yii::t('ui','Login'), 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
				array('label'=>Yii::t('ui','Logout (').Yii::app()->user->name.')', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest),
				array('label'=>Yii::t('ui','Help'), 'url'=>array('/site/page', 'view'=>'about')),
			),
		)); ?>
	</div><!-- mainmenu -->
	<?php if(isset($this->breadcrumbs)):?>
		<?php $this->widget('ext.bootstrap.widgets.BootCrumb', array(
			'links'=>$this->breadcrumbs,
		)); ?><!-- breadcrumbs -->	
	<?php endif?>

	<?php echo $content; ?>

	<div class="clear"></div>

	<div id="footer">
		Copyright &copy; <?php echo date('Y'); ?> by Invent.<br/>
		All Rights Reserved.<br/>
		<?php //echo Yii::powered(); ?>
	</div><!-- footer -->

</div><!-- page -->

</body>
</html>
