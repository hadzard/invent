<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'mesin-form',
	'enableAjaxValidation'=>true,
	'htmlOptions'=>array('enctype'=>'multipart/form-data'),
)); ?>

	<p class="note"><?php echo Yii::t('ui','Fields with'); ?> <span class="required">*</span> <?php echo Yii::t('ui','are required.'); ?></p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'barcode'); ?>
		<?php echo $form->textField($model,'barcode'); ?>
		<?php echo $form->error($model,'barcode'); ?>
	</div>
	
	
	<div class="row">
		<?php echo $form->labelEx($model,'os'); ?>
		<?php echo $form->textField($model,'os',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo $form->error($model,'os'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'office'); ?>
		<?php echo $form->textField($model,'office',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo $form->error($model,'office'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'label_coa'); ?>
		<?php echo $form->textField($model,'label_coa',array('size'=>60,'maxlength'=>128)); ?>
		<?php echo $form->error($model,'label_coa'); ?>
	</div>
	<div class="row">
		<div class="cpanel">
			
			<?php echo CHtml::label(Yii::t('ui','Input Data manual'),'group1'); ?>
			<?php echo CHtml::checkBox('g1', false, array('id'=>'group1')); ?>
			
			<div class="cpanelContent">

				<div class="row">
				</div>
				
				<div class="row">
					<?php echo $form->labelEx($model,'cabang_id'); ?>
					<?php //echo $form->textField($model,'cabang_id'); ?>
					<?php echo $form->dropDownList($model,'cabang_id', $model->getCabangOptions());
					?>
					<?php echo $form->error($model,'cabang_id'); ?>
				</div>

				<div class="row">
					<?php echo $form->labelEx($model,'user'); ?>
					<?php echo $form->textField($model,'user',array('size'=>60,'maxlength'=>128)); ?>
					<?php echo $form->error($model,'user'); ?>
				</div>

				<div class="row">
					<?php echo $form->labelEx($model,'divisi'); ?>
					<?php echo $form->textField($model,'divisi',array('size'=>60,'maxlength'=>128)); ?>
					<?php echo $form->error($model,'divisi'); ?>
				</div>

				<div class="row">
					<?php echo $form->labelEx($model,'jenis'); ?>
					<?php echo $form->dropDownList(
						$model,'jenis', $model->getJenisOptions()); ?>
					<?php echo $form->error($model,'jenis'); ?>
				</div>

				<div class="row">
					<?php echo $form->labelEx($model,'ram'); ?>
					<?php echo $form->textField($model,'ram',array('size'=>60,'maxlength'=>128)); ?>
					<?php echo $form->error($model,'ram'); ?>
				</div>

				<div class="row">
					<?php echo $form->labelEx($model,'hdd'); ?>
					<?php echo $form->textField($model,'hdd',array('size'=>60,'maxlength'=>128)); ?>
					<?php echo $form->error($model,'hdd'); ?>
				</div>

				<div class="row">
					<?php echo $form->labelEx($model,'ip'); ?>
					<?php echo $form->textField($model,'ip',array('size'=>60,'maxlength'=>128)); ?>
					<?php echo $form->error($model,'ip'); ?>
				</div>
			</div><!-- cpanelContent -->
		</div><!-- cpanel -->
	</div>
	
	<div class="row">
		<?php echo $form->labelEx($model,'file_name'); ?>
		
		<?php $this->widget('CMultiFileUpload',array(
			'name'=>'files',
			'accept'=>'html|txt',
			'max'=>1,
			'remove'=>Yii::t('ui','Remove'),
			//'denied'=>'', message that is displayed when a file type is not allowed
			//'duplicate'=>'', message that is displayed when a file appears twice
			'htmlOptions'=>array('size'=>25),
		)); ?>
		
		<?php echo $form->error($model,'file_name'); ?>		
	</div>
	<div class="hint"><?php echo Yii::t('ui','NB : SIW file name format must be :') ?> SIW_COMPUTERTYPE_BRANCH_DIVISION_USER_DATE.html
	</div>
	<div class="hint"> (Ex : SIW_PC_SUKABUMI_DA_CARLA_301012.html)
	</div>

<?php /**
	<ul>
		<?php foreach($this->findFiles() as $filename): ?>
			<li><?php echo CHtml::link($filename, Yii::app()->baseUrl.'/'.Yii::app()->params['uploadDir'].$filename, array('rel'=>'external'));?></li>
		<?php endforeach; ?>
	</ul>

**/ ?>
	
	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? Yii::t('ui','Create ') : Yii::t('ui','Save')); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->

<script type="text/javascript">
	$(document).ready(function() {
		$('[name*="race"]').click(function() {
		$('#otherrace').css('visibility', $('#other').attr('checked') ? 'visible':'hidden');
		});
    });
</script>