<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'cabang-form',
	'enableAjaxValidation'=>true,
)); ?>

	<p class="note"><?php echo Yii::t('ui','Fields with'); ?> <span class="required">*</span> <?php echo Yii::t('ui','are required.'); ?></p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nama'); ?>
		<?php echo $form->textField($model,'nama',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo $form->error($model,'nama'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'description'); ?>
		<?php echo $form->textField($model,'description',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo $form->error($model,'description'); ?>
	</div>
	
	<div class="row" >
		<?php if ($model->parent_id != 0)
		echo $form->labelEx($model,'parent_id'); ?>
		<?php if ($model->parent_id != 0)echo $form->dropDownList($model,'parent_id', $model->getParentDropdown()); ?>
		<?php if ($model->parent_id != 0) echo $form->error($model,'parent_id'); ?>
	</div>

	
	<div class="row">
		<?php echo $form->labelEx($model,'alamat'); ?>
		<?php echo $form->textField($model,'alamat',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo $form->error($model,'alamat'); ?>
	</div>

	<div class="row">
		
		<?php echo CHtml::activeLabelEx($model,'last_visit'); ?>
		<?php echo CHtml::activeTextField($model,'last_visit',array("id"=>"end_date")); ?>
		&nbsp;<?php echo Yii::t('ui','(calendar appears when textbox is clicked)'); ?>
		<?php $this->widget('application.extensions.calendar.SCalendar',
			array(
				'inputField'=>'end_date',
				'ifFormat'=>'%Y-%m-%d',
		));
    ?>
		<?php echo $form->error($model,'last_visit'); ?>
	</div>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? Yii::t('ui','Create ') : Yii::t('ui','Save')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->