<?php
	/**
	* RecentComments is a Yii widget used to display a list of recent
	comments
	*/
class RecentLicenses extends CWidget
{
	private $_licenses;
	public $displayLimit = 5;
	public $mesinId = null;
	
	public function init()
	{
		$this->_licenses = License::model()->findRecentLicenses($this->displayLimit,$this->mesinId);
	}
	
	public function getRecentLicenses()
	{
		return $this->_licenses;
	}
	
	public function run()
	{
		// this method is called by CController::endWidget()
		$this->render('renderLicenses');
	}
}