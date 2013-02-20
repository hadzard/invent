<?php

/**
 * This is the model class for table "tbl_license".
 *
 * The followings are the available columns in table 'tbl_license':
 * @property integer $id
 * @property string $	
 * @property string $coa
 * @property string $jenis
 * @property integer $mesin_id
 * @property string $create_time
 * @property integer $create_user_id
 * @property string $update_time
 * @property integer $update_user_id
 *
 * The followings are the available model relations:
 * @property Mesin $mesin
 */
class License extends ModelBase
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return License the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'tbl_license';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('mesin_id, create_user_id, update_user_id', 'numerical', 'integerOnly'=>true),
			array('Description, coa, jenis', 'length', 'max'=>128),
			array('create_time, update_time', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, Description, coa, jenis, mesin_id, create_time, create_user_id, update_time, update_user_id', 'safe', 'on'=>'search'),
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
			// 'coa' => array(self::BELONGS_TO, 'License', 'coa'),
			'mesin' => array(self::BELONGS_TO, 'Mesin', 'mesin_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'Description' => Yii::t('ui','Description'),
			'coa' => 'Coa',
			'jenis' => Yii::t('ui','Type License'),
			'mesin_id' => 'Mesin',
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
		$criteria->compare('Description',$this->Description,true);
		$criteria->compare('coa',$this->coa,true);
		$criteria->compare('jenis',$this->jenis,true);
		$criteria->compare('mesin_id',$this->mesin_id);
		$criteria->compare('create_time',$this->create_time,true);
		$criteria->compare('create_user_id',$this->create_user_id);
		$criteria->compare('update_time',$this->update_time,true);
		$criteria->compare('update_user_id',$this->update_user_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
	
	public function findRecentLicenses($limit=10, $mesinId=null)
	{
		if($mesinId != null)
		{
			return self::model()->with(array(
				'mesin'=>array('condition'=>'mesin_id='.$mesinId)))->findAll(array(
					'order'=>'t.create_time DESC',
					'limit'=>$limit,
			));
		}
		else
		{
			//get all comments across all projects
			return self::model()->with('mesin')->findAll(array(
				'order'=>'t.create_time DESC',
				'limit'=>$limit,
			));
		}
	}
}