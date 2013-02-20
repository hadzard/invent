<?php foreach($licenses as $license): ?>
<div class="license">
	<div class="time">
		<?php echo date('j F, Y ',strtotime($license->create_time)); ?>
	</div>
	<div class="Description">
		<?php echo $license->Description; ?>:
	</div>
	<div class="coa">
		<?php echo nl2br(CHtml::encode($license->coa)); ?>
	</div>
<hr>
</div><!-- license -->
<?php endforeach; ?>