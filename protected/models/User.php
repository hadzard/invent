<?php

/**
 * This is the model class for table "tbl_user".
 *
 * The followings are the available columns in table 'tbl_user':
 * @property integer $id
 * @property string $email
 * @property string $username
 * @property string $password
 * @property integer $level
 * @property string $last_login_time
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property Issue[] $issues
 * @property Project[] $tblProjects
 */
class User extends ModelBase
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return User the static model class
	 */
	 
	public $password_repeat;

	// Constant too add level user
	const LEVEL_SUPER_ADMIN = 0;
	const LEVEL_ADMIN = 1;
	const LEVEL_MEMBER = 2;
	
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('email,username,password', 'required'),
			array('create_user_id, level, update_user_id', 'numerical', 'integerOnly'=>true),
			array('email, username, password', 'length', 'max'=>256),
			array('last_login_time, create_time, update_time, password_repeat', 'safe'),
			array('email, username', 'unique'),
			array('password', 'compare'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, email, username, password, last_login_time, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
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
			'issues' => array(self::HAS_MANY, 'Issue', 'owner_id'),
			'tblProjects' => array(self::MANY_MANY, 'Project', 'tbl_project_user_assignment(user_id, project_id)'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'email' => 'Email',
			'username' => Yii::t('ui','Username'),
			'password' => Yii::t('ui','Password'),
			'password_repeat' => Yii::t('ui','Repeat Password'),
			'level' => Yii::t('ui','Authorisation'),
			'last_login_time' => Yii::t('ui','Last Login Time'),
			'create_time' => 'Create Time',
			'create_user_id' => 'Create User',
			'update_time' => 'Update Time',
			'update_user_id' => 'Update User',
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
		$criteria->compare('email',$this->email,true);
		$criteria->compare('username',$this->username,true);
		$criteria->compare('level',$this->level);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('last_login_time',$this->last_login_time,true);
		$criteria->compare('create_time',$this->create_time,true);
		$criteria->compare('create_user_id',$this->create_user_id);
		$criteria->compare('update_time',$this->update_time,true);
		$criteria->compare('update_user_id',$this->update_user_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
	
	/**
	* perform one-way encryption on the password before we store it in
	the database
	*/
	protected function afterValidate()
	{
		parent::afterValidate();
		$this->password = $this->encrypt($this->password);
	}

	public function encrypt($value)
	{
		return md5($value);
	}
	
	
	//	returning tipe options in viewpage for input
	public function getLevelOptions()
	{
		return array(
			// self::LEVEL_SUPER_ADMIN=>'Super Admin',
			self::LEVEL_ADMIN=>'Admin',
			self::LEVEL_MEMBER=>'Member',
		);
	}	
	
	/**
	* @return string the status text display for the current issue
	*/
	public function getLevelText()
	{
		$levelOptions=$this->levelOptions;
		return isset($levelOptions[$this->level]) ?
		$levelOptions[$this->level] : "unknown status ({$this->level})";
	}
}