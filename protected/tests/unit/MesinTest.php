<?php

class MesinTest extends CDbTestCase
{
	// data dummy dari table yang dsimpan di fixtures=> User table
	public $fixtures=array
	(
		'Mesins'=>'mesin',
		'users'=>'User',
		'mesinUserRole'=>':tbl_mesin_user_role',
	);
		
	public function testCreate()
	{
		//CREATE a new Mesin
		$newMesin=new Mesin;
		$newMesinUser = 'Test Mesin 1';
		$newMesin->setAttributes(array(
			'user' => $newMesinUser,
			'divisi' => 'This is test divisi 1',
			'jenis' => 'Test',
			'ram' => 'Test',
			'hdd' => 'Test',
			'os' => 'Test',
			'office' => 'Test',
			'label_coa' => 'Test',
			'file_name' => 'Test',
			'cabang_id' => 1,
			)
		);
		//set the application user id to the first user in our users fixture data
		Yii::app()->user->setId($this->users('user1')->id);
		$this->assertTrue($newMesin->save());
		//READ back the newly created Mesin to ensure the creation worked
		$retrievedMesin=Mesin::model()->findByPk($newMesin->id);
		$this->assertTrue($retrievedMesin instanceof Mesin);
		$this->assertEquals($newMesinUser,$retrievedMesin->user);
		$this->assertEquals(Yii::app()->user->id,$retrievedMesin->create_user_id);
	}
	
	public function testRead()
	{
		$retrievedMesin = $this->Mesins('mesin1');
		$this->assertTrue($retrievedMesin instanceof Mesin);
		$this->assertEquals('user 1',$retrievedMesin->user);
	}
	
	public function testUpdate()
	{
		$Mesin = $this->Mesins('mesin2');
		$updatedMesinUser = 'Updated Test Mesin 2';
		$Mesin->user = $updatedMesinUser;
		$this->assertTrue($Mesin->save(false));
		//read back the record again to ensure the update worked
		$updatedMesin=Mesin::model()->findByPk($Mesin->id);
		$this->assertTrue($updatedMesin instanceof Mesin);
		$this->assertEquals($updatedMesinUser,$updatedMesin->user);
	}
	
	// public function testDelete()
	// {
		// $Mesin = $this->Mesins('Mesin2');
		// $savedMesinId = $Mesin->id;
		// $this->assertTrue($Mesin->delete());
		// $deletedMesin=Mesin::model()->findByPk($savedMesinId);
		// $this->assertEquals(NULL,$deletedMesin);
	// }
	
	public function testJenisOptions()
	{
		$options = Mesin::model()->jenisOptions;
		$this->assertTrue(is_array($options));
		$this->assertTrue(2 == count($options));
		$this->assertTrue(in_array('Notebook', $options));
		$this->assertTrue(in_array('PC', $options));
	}	
	
	public function testCabangOptions()
	{
		$options = Mesin::model()->cabangOptions;
		$this->assertTrue(is_array($options));
		$this->assertTrue(count($options) > 0);
		$this->assertTrue(in_array('FBBDG', $options));
	}
	
	public function testAddLicense()
	{
		$license = new License;
		$license->Description = "this is content";
		$license->jenis = "this is content";
		$license->coa = "this is content";
		$this->assertTrue($this->Mesins('mesin1')->addLicense($license));
	}
	
	// test to add user role to mesin
	public function testUserRoleAssignment()
	{
		$mesin = $this->Mesins('mesin1');
		$user = $this->users('user1');
		$this->assertEquals(1,$mesin->associateUserToRole('owner',$user->id));
		$this->assertEquals(1,$mesin->removeUserFromRole('owner',$user->id));
	}
	
	// cek is role exist
	public function testIsInRole()
	{
		$row1 = $this->mesinUserRole['row1'];
		Yii::app()->user->setId($row1['user_id']);
		$mesin=Mesin::model()->findByPk($row1['mesin_id']);
		$this->assertTrue($mesin->isUserInRole('member'));
	}
	
	public function testUserAccessBasedOnMesinRole()
	{
		// $row1 = $this->mesinUserRole['row1'];
		// Yii::app()->user->setId($row1['user_id']);
		// $mesin=Mesin::model()->findByPk($row1['mesin_id']);
		// $auth = Yii::app()->authManager;
		// $bizRule='return isset($params["mesin"]) &&	$params["mesin"]->isUserInRole("member");';
		// $auth->assign('member',$row1['user_id'], $bizRule);
		// $params=array('mesin'=>$mesin);
		// $this->assertTrue(Yii::app()->user->checkAccess('updateMesin',$params));
		// $this->assertTrue(Yii::app()->user->checkAccess('readMesin',$params));
		// $this->assertTrue(Yii::app()->user->checkAccess('adminMesin',$params));
		// $this->assertFalse(Yii::app()->user->checkAccess('updateProject',$params));
	}
	
	public function testGetJenisText()
	{
		$this->assertTrue('PC' == $this->Mesins('mesin1')->getJenisText());
		$this->assertTrue('Notebook' == $this->Mesins('mesin2')->getJenisText());
	}
	
	public function testGetCabangText()
	{
		$mesin = $this->Mesins('mesin1');
		$cabang = Cabang::model()->findByPk($mesin->cabang_id);
		$cabangName = $cabang->nama;
		$this->assertEquals('FBBDG',$cabangName);
	}
		
	public function testCreateWithConvertDataFromFile()
	{
		//CREATE a new Mesin
		// $mesin = $this->Mesins('mesin1');
		// $mesin->createWithConvertDataFromFile();	
		// $this->assertEquals('SIW_PC_SUKABUMI_DA_CARLA_301012.html',$mesin->file_name);
		
		// $this->assertEquals('2048 MBytes',$mesin->ram);
		// $this->assertEquals('250.0 GB',$mesin->hdd);
		// $this->assertEquals('192.168.17.15 [da-skb]',$mesin->ip);
		
		// Second office license
		// $this->assertEquals('Microsoft Office Professional Enterprise Edition 2003',$mesin->licenses[3]->Description);
		// $this->assertEquals('GWH28-DGCMP-P6RC4-6J4MT-3HFDY',$mesin->licenses[3]->coa);
		// $this->assertEquals(1,$mesin->licenses[3]->mesin_id);
		
		// Second office license
		// $this->assertEquals('Microsoft Office Single Image 2010',$mesin->licenses[4]->Description);
		// $this->assertEquals('WYCVT-WBFR9-44WDT-PF962-7JCMG',$mesin->licenses[4]->coa);
		// $this->assertEquals(1,$mesin->licenses[4]->mesin_id);
		// windows license
		// $this->assertEquals('Windows 7 Professional (OEM:NONSLP)',$mesin->licenses[5]->Description);
		// $this->assertEquals('2MJG6-TQF2P-C8XTF-DP64X-8RWXC',$mesin->licenses[5]->coa);
		// $this->assertEquals('taken from SIW File',$mesin->licenses[3]->jenis);
		// $this->assertEquals(1,$mesin->licenses[5]->mesin_id);
	}	
	
	public function testLicenseExist()
	{
		$mesin = $this->Mesins('mesin1');
		$this->assertEquals(3,$mesin->licenseCount);	
	}
	
	public function testCountFilename()
	{
		$mesin = $this->Mesins('mesin1');
		$this->assertEquals(true, $mesin->validateFileName($mesin->file_name));
	}
	
	public function testListSiw()
	{
		$result = 'Office : 2MJG6-TQF2P-C8XTF-DP64X-8RWXCh';
		$result .= "\n";
		$result .= 'Office : COA 2';
		$result .= "\n";
		$result .= 'this is content : this is content';
		$result .= "\n";
		
		$mesin = $this->Mesins('mesin1');
		$this->assertEquals($result, $mesin->getAllLicenses());
	}
}