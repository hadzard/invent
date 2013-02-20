<ul>
	<?php foreach($this->getRecentLicenses() as $license): ?>

	<div class="Description">
		<?php echo $license->Description.' '.Yii::t('ui','added a License.'); ?>
	</div>
	
	<div class="coa">
		<?php echo CHtml::link(CHtml::encode($license->mesin->user),array('mesin/view', 'id'=>$license->mesin_id)); ?>
	</div>
	<?php endforeach; ?>
</ul>
