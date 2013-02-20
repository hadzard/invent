<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'license-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note"><?php echo Yii::t('ui','Fields with'); ?> <span class="required">*</span> <?php echo Yii::t('ui','are required.'); ?></p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'Description'); ?>
		<?php echo $form->textField($model,'Description',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo $form->error($model,'Description'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'coa'); ?>
		<?php echo $form->textField($model,'coa',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo $form->error($model,'coa'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'jenis'); ?>
		<?php echo $form->textField($model,'jenis',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo $form->error($model,'jenis'); ?>
	</div>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? Yii::t('ui','Create ') : Yii::t('ui','Save ')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->