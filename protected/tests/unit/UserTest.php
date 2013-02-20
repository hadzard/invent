<?php
	
class UserTest extends CDbTestCase
{
	// data dummy dari table yang dsimpan di fixtures=> User table
	public $fixtures=array
	(
		'users'=>'User',
	);
	
	public function testGetLevel()
	{
		$options = User::model()->levelOptions;
		$this->assertTrue(is_array($options));
		$this->assertTrue(2 == count($options));
		// $this->assertTrue(in_array('Super Admin', $options));
		$this->assertTrue(in_array('Admin', $options));
		$this->assertTrue(in_array('Member', $options));
	}
	
	public function testGetLevelText()
	{
		// $this->assertTrue('Super Admin' == $this->users('user1')->getLevelText());
		$this->assertTrue('Admin' == $this->users('user2')->getLevelText());
		$this->assertTrue('Member' == $this->users('user3')->getLevelText());
	}	
};