<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('barcode')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->barcode), array('view', 'barcode'=>$data->barcode)); ?>
	<br />
	
	<b><?php echo CHtml::encode($data->getAttributeLabel('user')); ?>:</b>
	<?php echo CHtml::encode($data->user); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('divisi')); ?>:</b>
	<?php echo CHtml::encode($data->divisi); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('jenis')); ?>:</b>
	<?php echo CHtml::encode($data->getJenisText()); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ram')); ?>:</b>
	<?php echo CHtml::encode($data->ram); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('hdd')); ?>:</b>
	<?php echo CHtml::encode($data->hdd); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('os')); ?>:</b>
	<?php echo CHtml::encode($data->os); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ip')); ?>:</b>
	<?php echo CHtml::encode($data->ip); ?>
	<br />
	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('office')); ?>:</b>
	<?php echo CHtml::encode($data->office); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('label_coa')); ?>:</b>
	<?php echo CHtml::encode($data->label_coa); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('file_name')); ?>:</b>
	<?php echo CHtml::encode($data->file_name); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('create_time')); ?>:</b>
	<?php echo CHtml::encode($data->create_time); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('create_user_id')); ?>:</b>
	<?php echo CHtml::encode($data->create_user_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('update_time')); ?>:</b>
	<?php echo CHtml::encode($data->update_time); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('update_user_id')); ?>:</b>
	<?php echo CHtml::encode($data->update_user_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cabang_id')); ?>:</b>
	<?php echo CHtml::encode($data->cabang_id); ?>
	<br />

	*/ ?>

</div>