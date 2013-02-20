<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'Inventory Application',
	// For language selection
	'defaultController'=>'Mesin',
	'language'=>'en',

	// Home Urls
	// 'homeUrl'=>'/invent_test/index.php/mesin',
	
	// preloading 'log' component
	'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
		'ext.helpers.XHtml',
		'ext.EExcelView.*',
		'ext.phpexcel.*',
		'ext.components.*',
	),

	'modules'=>array(
		// uncomment the following to enable the Gii tool
		
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'admin',
		 	// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
		),		
	),
	
	// application components
	'components'=>array(
		'user'=>array(
			// enable cookie-based authentication
			'class'=>'application.components.EWebUser',
			'allowAutoLogin'=>true,
		),
		'bootstrap'=>array('class'=>'ext.bootstrap.components.Bootstrap'),
		// Auth Manager to make auth manager from database
		// 'authManager'=>array(
			// 'class'=>'CDbAuthManager',
			// 'connectionID'=>'db',
		// ),
		// uncomment the following to enable URLs in path-format

		'urlManager'=>array(
			'class' => 'ext.components.language.XUrlManager',
			'urlFormat'=>'path',
			'showScriptName'=>true,
			'appendParams'=>false,
			'rules'=>array(
				'<language:\w{2}>' => 'site/index',
				'<language:\w{2}>/<_c:\w+>' => '<_c>',
				'<language:\w{2}>/<_c:\w+>/<_a:\w+>'=>'<_c>/<_a>',
				'<language:\w{2}>/<_m:\w+>' => '<_m>',
				'<language:\w{2}>/<_m:\w+>/<_c:\w+>' => '<_m>/<_c>',
				'<language:\w{2}>/<_m:\w+>/<_c:\w+>/<_a:\w+>' => '<_m>/<_c>/<_a>',
			),
		/*
			'urlFormat'=>'path',
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		*/	
		),
		
		/*
		'db'=>array(
			'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
		),
		// uncomment the following to use a MySQL database
		*/
		'db'=>array(
			'connectionString' => 'mysql:host=localhost;dbname=invent',
			'emulatePrepare' => true,
			'username' => 'root',
			'password' => 'hadzard',
			'charset' => 'utf8',
		),
		
		'errorHandler'=>array(
			// use 'site/error' action to display errors
            'errorAction'=>'site/error',
        ),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
					),
				*/
			),
		),
		'coreMessages'=>array(
			'basePath'=>'protected/messages',
		),

	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'webmaster@example.com',
		//upload directory
		'uploadDir' => 'protected/upload/',
	),
	
	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	// 'params'=>require(dirname(__FILE__).'/params.php'),

);