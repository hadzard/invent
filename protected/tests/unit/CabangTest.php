<?php

class CabangTest extends CDbTestCase
{
	// data dummy dari table yang dsimpan di fixtures=> nama table
	public $fixtures=array
	(
		'cabangs'=>'Cabang',
		'users'=>'User',
		'cabangUserRole'=>':tbl_cabang_user_role',
		'authAssign'=>':AuthAssignment',
	);
	
	public function testCreate()
	{
		//CREATE a new Cabang
		$newCabang=new Cabang;
		$newCabangnama = 'Test Cabang 1';
		$newCabang->setAttributes(array(
			'nama' => $newCabangnama,
			'alamat' => 'This is a test for new Cabang creation',
			'last_visit' => '2009-09-09 00:00:00',
			// 'createTime' => '2009-09-09 00:00:00',
			// 'createUser' => '1',
			// 'updateTime' => '2009-09-09 00:00:00',
			// 'updateUser' => '1',
			)
		);
		$this->assertTrue($newCabang->save(false));
		//READ back the newly created Cabang to ensure the creation worked
		$retrievedCabang=Cabang::model()->findByPk($newCabang->id);
		$this->assertTrue($retrievedCabang instanceof Cabang);
		$this->assertEquals($newCabangnama,$retrievedCabang->nama);
	}
	
	public function testRead()
	{
		$retrievedCabang = $this->cabangs('cabang1');
		$this->assertTrue($retrievedCabang instanceof Cabang);
		$this->assertEquals('FBBDG',$retrievedCabang->nama);
	}
	
	public function testUpdate()
	{
		$Cabang = $this->cabangs('cabang2');
		$updatedCabangnama = 'Updated Test Cabang 2';
		$Cabang->nama = $updatedCabangnama;
		$this->assertTrue($Cabang->save(false));
		//read back the record again to ensure the update worked
		$updatedCabang=Cabang::model()->findByPk($Cabang->id);
		$this->assertTrue($updatedCabang instanceof Cabang);
		$this->assertEquals($updatedCabangnama,$updatedCabang->nama);
	}
	
	// public function testDelete()
	// {
		// $Cabang = $this->cabangs('Cabang2');
		// $savedCabangId = $Cabang->id;
		// $this->assertTrue($Cabang->delete());
		// $deletedCabang=Cabang::model()->findByPk($savedCabangId);
		// $this->assertEquals(NULL,$deletedCabang);
	// }
	
	public function testUserRoleAssignment()
	{
		$cabang = $this->cabangs('cabang2');
		$user = $this->users('user1');
		$user2 = $this->users('user2');
		$this->assertEquals(1,$cabang->associateUserToRole('owner',$user->id));
		$this->assertEquals(1,$cabang->associateUserToRole('member',$user2->id));
		$this->assertEquals(1,$cabang->removeUserFromRole('member',$user2->id));
		$this->assertEquals(1,$cabang->associateUserToRole('member',$user2->id));
	}
	
	public function testIsInRole()
	{
		$user = $this->users('user1');
		Yii::app()->user->setId($user->id);
		
		$cabang = $this->cabangs('cabang1');
		$this->assertTrue($cabang->isUserInRole('owner'));
	}
/**	
	public function testUserAccessBasedOnCabangRole()
	{
		$row1 = $this->cabangUserRole['row1'];
		Yii::app()->user->setId($row1['user_id']);
		$cabang=Cabang::model()->findByPk($row1['cabang_id']);
		$auth = Yii::app()->authManager;
		$bizRule='return isset($params["cabang"]) && $params["cabang"]->isUserInRole("owner");';
		
		$auth->assign('owner',$row1['user_id'], $bizRule);
		$params=array('cabang'=>$cabang);
		$this->assertTrue(Yii::app()->user->checkAccess('createCabang',$params));
		$this->assertTrue(Yii::app()->user->checkAccess('readCabang',$params));
		$this->assertTrue(Yii::app()->user->checkAccess('updateCabang',$params));
		$this->assertTrue(Yii::app()->user->checkAccess('adminCabang',$params));
		$this->assertTrue(Yii::app()->user->checkAccess('deleteCabang',$params));
		
		// For member
		$row_member = $this->cabangUserRole['row2'];
		Yii::app()->user->setId($row_member['user_id']);
		$cabang_member=Cabang::model()->findByPk($row_member['cabang_id']);
		$auth_member = Yii::app()->authManager;
		$bizRule_member='return isset($params["cabang"]) && $params["cabang"]->isUserInRole("member");';
		
		$auth_member->assign('member',$row_member['user_id'], $bizRule_member);
		$params_member=array('cabang'=>$cabang_member);
		$this->assertFalse(Yii::app()->user->checkAccess('createCabang',$params_member));
		$this->assertTrue(Yii::app()->user->checkAccess('readCabang',$params_member));
		$this->assertFalse(Yii::app()->user->checkAccess('updateCabang',$params_member));
		$this->assertFalse(Yii::app()->user->checkAccess('adminCabang',$params_member));
		$this->assertFalse(Yii::app()->user->checkAccess('deleteCabang',$params_member));
	
	} **/

	public function testGetParent()
	{
		$cabang = $this->cabangs('cabang2');
		$options = $cabang->getParentDropdown();
		$this->assertTrue(is_array($cabang->getParentDropdown()));
		$this->assertEquals(4, count($cabang->getParentDropdown()));
		// $this->assertTrue(in_array('FBBDG', $cabang->getParentDropdown()['nama']));
		// $this->assertTrue(in_array('FBPST', $cabang->getParentDropdown()['nama']));
	}
}