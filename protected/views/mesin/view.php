<?php
$this->breadcrumbs=array(
	Yii::t('ui','PC User')=>array('index'),
	$model->user,
);

$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
		array('label'=>Yii::t('ui','List ').Yii::t('ui','PC User'), 'url'=>array('index')),
		array('label'=>Yii::t('ui','Create ').Yii::t('ui','PC User'), 'url'=>array('create')),
		array('label'=>Yii::t('ui','Update ').Yii::t('ui','PC User'), 'url'=>array('update', 'id'=>$model->id)),
		array('label'=>Yii::t('ui','Delete ').Yii::t('ui','PC User'), 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>Yii::t('ui','Are you sure you want to delete this item?'))),
    ),
));

?>

<h1><?php echo Yii::t('ui','View ') ?> PC <?php echo $model->user; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'barcode',
		'user',
		'divisi',
		array(
			'name'=>'jenis',
			'value'=>CHtml::encode($model->getJenisText())
		),
		'ram',
		'hdd',
		'os',
		'office',
		'label_coa',
		'ip',
		array(
			'name'=>'cabang_id',
			'value'=>CHtml::encode($model->getCabangText())
		),
		'file_name',
	),
)); 
?>

<div id="licenses">
	<?php if($model->licenseCount>=1): ?>
		<h3>
			<?php echo $model->licenseCount>1 ? $model->licenseCount . ' '. Yii::t('ui',' licenses') : Yii::t('ui','One license'); ?>
		</h3>
		<?php $this->renderPartial('_licenses',array('licenses'=>$model->licenses,)); ?>
	<?php endif; ?>
	
	<h3><?php echo Yii::t('ui','Add ').Yii::t('ui','a License'); ?></h3>
	<?php if(Yii::app()->user->hasFlash('licenseSubmitted')): ?>
			<div class="flash-success">
				<?php echo Yii::app()->user->getFlash('licenseSubmitted'); ?>
			</div>
		<?php else: ?>
			<?php $this->renderPartial('/license/_form',array(
					'model'=>$license,
				));
			?>
	<?php endif; ?>
</div>
	
<div id="files">
	<h3>
		<?php echo Yii::t('ui','SIW Files'); ?>
	</h3>
	<?php foreach($this->findFiles($model->id) as $filename): ?>
		<li>
			<?php echo CHtml::link($filename, 
				array('mesin/downloadSiw','id'=>$model->id,'filename'=>$filename),
				array('rel'=>'external')
			);
			?>
		</li>
	<?php endforeach; ?>
</div>