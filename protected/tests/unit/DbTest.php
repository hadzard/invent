<?php
class DbTest extends CTestCase
{
	public function testConnection()
	{								// mengambil nilai dari koneksi database
		$this->assertNotEquals(NULL, Yii::app()->db);
	}
}