<?php
$this->breadcrumbs=array(
	'Licenses'=>array('index'),
	'Create',
);

$this->widget('ext.ddmenu.XDropDownMenu', array(
    'items'=>array(
		array('label'=>'List License', 'url'=>array('index')),
	),
));

// $this->menu=array(
	// array('label'=>'List License', 'url'=>array('index')),
	// array('label'=>'Manage License', 'url'=>array('admin')),
// );
?>

<h1>Create License</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>