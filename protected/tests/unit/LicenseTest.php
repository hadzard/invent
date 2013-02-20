<?php
class LicenseTest extends CDbTestCase
{
	public $fixtures=array(
		'licenses'=>'License',
		);
	
	public function testRecentLicenses()
	{
		$recentLicenses=License::findRecentLicenses();
		$this->assertTrue(is_array($recentLicenses));
		$this->assertEquals(count($recentLicenses),3);

		//make sure the limit is working
		$recentLicenses = License::findrecentLicenses(2);
		$this->assertTrue(is_array($recentLicenses));
		$this->assertEquals(count($recentLicenses),2);
		
		//test retrieving comments only for a specific project
		$recentLicenses = License::findrecentLicenses(5, 3);
		$this->assertTrue(is_array($recentLicenses));
		$this->assertEquals(count($recentLicenses),1);
	}
}