<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'user-form',
	'enableAjaxValidation'=>true,
)); ?>

	<p class="note"><?php echo Yii::t('ui','Fields with') ;?><span class="required">*</span> <?php echo Yii::t('ui','are required.'); ?></p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'email'); ?>
		<?php echo $form->textField($model,'email',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($model,'email'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'username'); ?>
		<?php echo $form->textField($model,'username',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($model,'username'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'password'); ?>
		<?php echo $form->passwordField($model,'password',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($model,'password'); ?>
	</div>
	<div class="row">
		<?php echo $form->label($model,'password_repeat'); ?>
		<?php echo $form->passwordField($model,'password_repeat',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($model,'password_repeat'); ?>
	</div>
	<div class="row">
		<?php echo $form->label($model,'level'); ?>
		<?php echo $form->dropDownList(
					$model,'level', $model->getLevelOptions(), array(
					"disabled"=> Yii::app()->user->level==2 ? "disabled" : ""  )); 
					?> 
		<?php echo $form->error($model,'level'); ?>
	</div>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? Yii::t('ui','Create ') : Yii::t('ui','Save')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->