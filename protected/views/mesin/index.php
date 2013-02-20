<?php
$this->breadcrumbs=array(
	'PC User',
);


$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
		array('label'=>'Create PC User', 'url'=>array('create')),
		// array('label'=>'Manage Mesin', 'url'=>array('admin')),
    ),
));

?>

<h1>PC Users</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>

<?php $this->beginWidget('zii.widgets.CPortlet', array(
	'title'=>'Recent Licenses',
		));
	$this->widget('RecentLicenses');
	$this->endWidget(); 
?>