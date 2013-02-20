<?php

/**
 * This is the model class for table "tbl_mesin".
 *
 * The followings are the available columns in table 'tbl_mesin':
 * @property integer $id
 * @property integer $barcode
 * @property string $user
 * @property string $divisi
 * @property string $jenis
 * @property string $ram
 * @property string $hdd
 * @property string $os
 * @property string $office
 * @property string $label_coa
 * @property string $file_name
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 * @property string $cabang_id
 * @property string $ip
 *
 * The followings are the available model relations:
 * @property Case[] $cases
 * @property License[] $licenses
 */
class Mesin extends ModelBase
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Mesin the static model class
	 */
	 
	// Constant value untuk tipe Issue
	const JENIS_NOTEBOOK=0;
	const JENIS_PC=1;

	//	Constant for regex from html
	public $regex_endspace = '/^\s+|\s+$/';
	public $license;
	
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_mesin';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('cabang_id', 'required'),
			array('barcode', 'numerical', 'integerOnly'=>true),
			array('user, divisi, file_name, jenis, ram, hdd, os, office, label_coa,  ip', 'length', 'max'=>128),
			array('create_time, update_time', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, barcode, user, divisi, jenis, ram, hdd, os, office, label_coa, file_name, create_time, create_user_id, update_time, update_user_id, cabang_id, ip', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'cases' => array(self::HAS_MANY, 'Case', 'mesin_id'),
			'licenses' => array(self::HAS_MANY, 'License', 'mesin_id'),
			'cabangs' => array(self::BELONGS_TO, 'Cabang', 'cabang_id'),
			'licenseCount' => array(self::STAT, 'License', 'mesin_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'barcode' => 'Barcode',
			'user' => Yii::t('ui','PC User'),
			'divisi' => Yii::t('ui','Division'),
			'jenis' => Yii::t('ui','Type'),
			'ram' => 'RAM',
			'hdd' => 'HDD',
			'os' => 'Os',
			'office' => Yii::t('ui','Office(Physical)'),
			'label_coa' => Yii::t('ui','Label Coa(Physical)'),
			'file_name' => Yii::t('ui','File Name'),
			'create_time' => 'Create Time',
			'create_user_id' => 'Create User',
			'update_time' => 'Update Time',
			'update_user_id' => 'Update User',
			'cabang_id' => Yii::t('ui','Branch'),
			'ip' => Yii::t('ui','IP Address'),
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('barcode',$this->barcode);
		$criteria->compare('user',$this->user,true);
		$criteria->compare('divisi',$this->divisi,true);
		$criteria->compare('jenis',$this->jenis,true);
		$criteria->compare('ram',$this->ram,true);
		$criteria->compare('hdd',$this->hdd,true);
		$criteria->compare('os',$this->os,true);
		$criteria->compare('office',$this->office,true);
		$criteria->compare('label_coa',$this->label_coa,true);
		$criteria->compare('file_name',$this->file_name,true);
		$criteria->compare('create_time',$this->create_time,true);
		$criteria->compare('create_user_id',$this->create_user_id);
		$criteria->compare('update_time',$this->update_time,true);
		$criteria->compare('update_user_id',$this->update_user_id);
		$criteria->compare('cabang_id',$this->cabang_id,true);
		$criteria->compare('ip',$this->ip);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
	
	// Get Option Jenis 
	public function getJenisOptions()
	{
		return array(
			self::JENIS_NOTEBOOK=>'Notebook',
			self::JENIS_PC=>'PC',
			);
	}
	
	/**
	* @return string the status text display for the current issue
	*/
	public function getJenisText()
	{
		$statusOptions=$this->jenisOptions;
		return isset($statusOptions[$this->jenis]) ?
		$statusOptions[$this->jenis] : "unknown status ({$this->jenis})";
	}

	// Get List Of Cabang
	public function getCabangOptions()
	{
		$cabangs = Cabang::model()->findAll();
		$cabangArray = CHtml::listData($cabangs,'id','nama');
		return $cabangArray ;
	}
	
	// return text cabang name to the database to save in mesin
	public function getCabangText()
	{
		$cabang = Cabang::model()->findByPk($this->cabang_id);
		return $cabang->nama;		
	}
	
	// Adding license to mesin
	public function addLicense($license)
	{
		$license->mesin_id = $this->id;
		return $license->save();
	}
	
	public function associateUserToRole($role, $userId)
	{
		$sql = "INSERT INTO tbl_mesin_user_role (mesin_id, user_id,	role) VALUES (:mesinId, :userId, :role)";
		$command = Yii::app()->db->createCommand($sql);
		$command->bindValue(":mesinId", $this->id, PDO::PARAM_INT);
		$command->bindValue(":userId", $userId, PDO::PARAM_INT);
		$command->bindValue(":role", $role, PDO::PARAM_STR);
		return $command->execute();
	}
	
	public function removeUserFromRole($role, $userId)
	{
		$sql = "DELETE FROM tbl_mesin_user_role WHERE mesin_id=:mesinId AND user_id=:userId AND role=:role";
		$command = Yii::app()->db->createCommand($sql);
		$command->bindValue(":mesinId", $this->id, PDO::PARAM_INT);
		$command->bindValue(":userId", $userId, PDO::PARAM_INT);
		$command->bindValue(":role", $role, PDO::PARAM_STR);
		return $command->execute();
	}
	
	public function isUserInRole($role)
	{
		$sql = "SELECT role FROM tbl_mesin_user_role WHERE mesin_id=:mesinId  AND user_id=:userId AND role=:role";
		$command = Yii::app()->db->createCommand($sql);
		$command->bindValue(":mesinId", $this->id, PDO::PARAM_INT);
		$command->bindValue(":userId", Yii::app()->user->getId(),PDO::PARAM_INT);
		$command->bindValue(":role", $role, PDO::PARAM_STR);
		return $command->execute()==1 ? true : false;
	}
	
	// change from filename to user, jenis, divisi and cabang to save to database
	public function saveFromFilename()
	{
		list($siw, $jenis, $cabang, $divisi, $username) = explode('_',$this->file_name);
		
		$this->jenis = $jenis;
		// change from jenis text taken from file name to integer field
		$this->changeJenisFromFile();
		
		$this->cabang_id = $cabang;
		
		// change from cabang text to cabang id
		$this->changeCabangFromFile();
		
		$this->divisi = $divisi;
		$this->user = $username;	
		
		//save change to save the id of cabang
		$this->save();
		$this->createWithConvertDataFromFile();
	}

	public function validateFileName($filename)
	{
		if (count(explode('_',$this->file_name)) < 5)
		{
			$this->addError('file_name','Incorrect Filename, file name should be : SIW_COMPUTERTYPE_BRANCH_DIVISION_USER_DATE.html ');
			return false;
		}
		else
		{
			return true;
		}
	}
	
	// change from jenis text taken from file name to integer field
	private function changeJenisFromFile()
	{
		switch(strtolower($this->jenis)):
			case 'notebook':
				$this->jenis = 0;
				break;
			case 'pc':
				$this->jenis = 1;
				break;
			default:
				$this->jenis = 3;
		endswitch;		
	}
	
	// change from cabang text to cabang id
	private function changeCabangFromFile()
	{
		$cabangName = strtolower($this->cabang_id);
		$cabangFromName = Cabang::model()->findByAttributes(array('nama'=>$this->cabang_id));
		return $cabangFromName ? $this->cabang_id = $cabangFromName->id : $this->cabang_id = 9999;
	}
			
	// Save data mesin from html file
	public function createWithConvertDataFromFile()
	{
		$this->makeDir(Yii::app()->basePath .'/process/', $this->id);
		
		// move file to process folder
		rename(Yii::app()->basePath .'/upload/'.$this->file_name, Yii::app()->basePath .'/process/'.$this->id.'/'.$this->file_name);
		
		$lines = file(Yii::app()->basePath .'/process/'.$this->id.'/'.$this->file_name);
		$start_license;
		$end_license;
		$start_memory;
		$end_memory;
		$start_storage;
		$end_storage;
		$start_network;
		$end_network;
		
		// make a mark on lines oh siw html to select necesarry lines to get the value
		for($i=0; $i<count($lines); $i++)
		{
			$search_line = strtolower(substr($this->removeEndSpace($lines[$i]),0,19));
			
			switch ($search_line):
				case strtolower(substr($this->removeEndSpace('<a id="Licenses"></a>'),0,19)):	
					$start_license = $i;
					break;
				case strtolower(substr($this->removeEndSpace('<!-- SEH: Licenses Duration: 0.649 seconds-->'),0,19)):
					$end_license = $i;
					$this->convertLicense($lines, $start_license, $end_license);
					break;
				case strtolower(substr($this->removeEndSpace('<a id="Memory"></a>'),0,19)):
					$start_memory = $i;
					break;
				case strtolower(substr($this->removeEndSpace('<!-- SEH: Memory Duration: 0.025 seconds-->'),0,19)):
					$end_memory = $i;
					$this->ram = $this->convertRAM($lines, $start_memory, $end_memory);
					break;
				case strtolower(substr($this->removeEndSpace('<a id="Storage_Devices"></a>'),0,19)):	
					$start_storage = $i;
					break;
				case strtolower(substr($this->removeEndSpace('<!-- SEH: Storage Devices Duration: 1.055 seconds-->'),0,19)):
					$end_storage = $i;
					$this->hdd = $this->convertHDD($lines, $start_storage, $end_storage);
					break;
				case strtolower(substr($this->removeEndSpace('<a id="Network_Information"></a>'),0,19)):	
					$start_network = $i;
					break;
				case strtolower(substr($this->removeEndSpace('<!-- SEH: Network Information Duration: 1.205 seconds-->'),0,19)):
					$end_network = $i;
					$this->ip = $this->convertIP($lines, $start_network, $end_network);
					break;
			endswitch;
		}
	}
	
	// create new directory as id mesin
	public function makeDir($path, $id)
	{
	   if (!is_dir($path.'/'.$id)) 
			mkdir($path.'/'.$id);
	}
	
	// converting from RAM section to RAM value
	private function convertRAM($lines, $start_memory, $end_memory)
	{
		$ram;
		
		for($j=$start_memory; $j<=$end_memory; $j++)
		{
			if(strtolower('<TD>Capacity') == strtolower(substr($lines[$j],0,12)))
			{
				$ram = $this->removeTags('/<TD>/','</TD>', $lines[$j + 1]);	
				$ram = $this->removeTags('/<td>/','</td>', $ram);	
			}
		}
		
		return $ram ? $ram : 'Not Supported';
	}
	
	// converting from Storage section to HDD value
	private function convertHDD($lines, $start_storage, $end_storage)
	{
		$hdd;
		
		for($j=$start_storage; $j<=$end_storage; $j++)
		{
			if((strtolower('<TD>Disk 0</TD>') == strtolower(substr($lines[$j],0,15))) || (strtolower('Disk 0</TD>') == strtolower(substr($lines[$j],29,40))))
			{
				$hdd = $this->removeTags('/<TD>/','</TD>', $lines[$j + 19]);	
				$hdd = $this->removeTags('/<td>/','</td>', $hdd);	
			}
		}
		
		return $hdd ? $hdd : 'Not Supported';
	}
	
	// converting from Storage section to HDD value
	private function convertIP($lines, $start_network, $end_network)
	{
		$ip;
		
		for($j=$start_network; $j<=$end_network; $j++)
		{
			if(strtolower('<TD>IPv4 Address</TD>') == strtolower(substr($lines[$j],0,21)))
			{
				$ip = $this->removeTags('/<TD>/','</TD>', $lines[$j + 1]);	
				$ip = $this->removeTags('/<td>/','</td>', $ip);	
			}
		}
		
		return $ip ? $ip : 'Not Supported';
	}
	
	// converting from license section to list of license
	private function convertLicense($lines, $start_license, $end_license)
	{
		$office_license;
		$windows_license;
		
		$this->removeLicense();
		
		for($i=$start_license; $i<=$end_license; $i++)
		{
			if(strtolower('<TD>Microsoft Office') == strtolower(substr($lines[$i],0,20)))
			{	
				// add semua license
				$office_license = new License;
				$office_license->Description = $this->removeTags('/<TD>/','</TD>', $lines[$i]);				
				$office_license->Description = $this->removeTags('/<td>/','</td>', $office_license->Description);				
				$office_license->coa = $this->removeTags('/<TD>/','</TD>',$lines[$i + 1]); // di split
				$office_license->coa = $this->removeTags('/<td>/','</td>',$office_license->coa); // di split
				$office_license->jenis= 'taken from SIW File'; // di split

				// save license office
				if ($office_license !== NULL)
					$this->addLicense($office_license);
			}
			
			if(strtolower('<TD>Windows Product Key</TD>') == strtolower(substr($lines[$i],0,28)))
			{
				$windows_license = new License;
				$windows_license->Description = $this->removeTags('/<TD>/','</TD>', $windows_license->Description);				
				$windows_license->Description = $this->removeTags('/<td>/','</td>', $lines[$i + 4]);				
				$windows_license->coa = $this->removeTags('/<TD>/','</TD>',$lines[$i + 1]); // di split	
				$windows_license->coa = $this->removeTags('/<td>/','</td>',$windows_license->coa); // di split	
				$windows_license->jenis = 'taken from SIW File'; // di split
				
				// save windows license
				if ($windows_license !== NULL)
					$this->addLicense($windows_license);			
			}			
		}
	}

	// check if COA and mesin id is already exist
	public function removeLicense()
	{
		foreach($this->licenses as $license)
			$license->delete();
			
	}
	
	// return characted without end space
	private function removeEndSpace($character)
	{
		return preg_replace($this->regex_endspace,'',$character);
	}
	
	//remove html tags and spaces 
	private function removeTags($begin_tags, $end_tags, $input)
	{
		return preg_replace(array($begin_tags, $end_tags, $this->regex_endspace,'[<>]'),array('','','',''),$input);
	}
	
	// make pall licenses to be plain text
	public function getAllLicenses()
	{
		$license = new License;
		$licenseText = '';
		if($this->licenseCount > 0)
		{	
			foreach($this->licenses as $license)
			{
				$licenseText = $licenseText. $license->Description;
				$licenseText .= ' : '.$license->coa;
				$licenseText = $licenseText. "\n";
			}
		}	
		
		return $licenseText;
	}
}