<?php
class RbacCommand extends CConsoleCommand
{
	private $_authManager;

	public function getHelp()
	{
		return <<<EOD
		USAGE
			rbac
		DESCRIPTION
			This command generates an initial RBAC authorization hierarchy.
EOD;
	}
	
	/**
	* Execute the action.
	* @param array command line parameters specific for this command
	*/
	public function run($args)
	{
		//ensure that an authManager is defined as this is mandatory for creating an auth heirarchy
		if(($this->_authManager=Yii::app()->authManager)===null)
		{
			echo "Error: an authorization manager, named 'authManager' must be configured to use this command.\n";
			echo "If you already added 'authManager' component in application configuration,\n";
			echo "please quit and re-enter the yiic shell.\n";
			return;
		}
		//provide the oportunity for the use to abort the request
		echo "This command will create three roles: Owner, Member, and Reader and the following premissions:\n";
		echo "create, read, update and delete user\n";
		echo "create, read, update and delete project\n";
		echo "create, read, update and delete issue\n";
		echo "Would you like to continue? [Yes|No] ";
		//check the input from the user and continue if they indicated yes to the above question
		if(!strncasecmp(trim(fgets(STDIN)),'y',1))
		{
			//first we need to remove all operations, roles, child relationship	and assignments
			$this->_authManager->clearAll();
			//create the lowest level operations for users
			$this->_authManager->createOperation("createUser","create a new user");
			$this->_authManager->createOperation("readUser","read user profile information");
			$this->_authManager->createOperation("updateUser","update a users information");
			$this->_authManager->createOperation("deleteUser","remove a user from a project");
			$this->_authManager->createOperation("adminUser","manage user from a project");
			//create the lowest level operations for cabang
			$this->_authManager->createOperation("createCabang","create a new Cabang");
			$this->_authManager->createOperation("readCabang","read Cabang information");
			$this->_authManager->createOperation("updateCabang","up date Cabang information");
			$this->_authManager->createOperation("deleteCabang","delete a Cabang");
			$this->_authManager->createOperation("adminCabang","manage a Cabang");
			//create the lowest level operations for mesin
			$this->_authManager->createOperation("createMesin","create a new Mesin");
			$this->_authManager->createOperation("readMesin","read Mesin information");
			$this->_authManager->createOperation("updateMesin","update Mesin information");
			$this->_authManager->createOperation("deleteMesin","delete an Mesin from a project");
			$this->_authManager->createOperation("adminMesin","manage an Mesin from a project");
			//create the reader role and add the appropriate permissions as	children to this role
			$role=$this->_authManager->createRole("reader");
			$role->addChild("readUser");
			$role->addChild("readCabang");
			$role->addChild("readMesin");
			//create the member role, and add the appropriate permissions, as well as the reader role itself, as children
			$role=$this->_authManager->createRole("member");
			$role->addChild("reader");
			$role->addChild("createMesin");
			$role->addChild("updateMesin");
			$role->addChild("deleteMesin");
			//create the owner role, and add the appropriate permissions, as well as both the reader and member roles as children
			$role=$this->_authManager->createRole("owner");
			$role->addChild("reader");
			$role->addChild("member");
			$role->addChild("createUser");
			$role->addChild("updateUser");
			$role->addChild("deleteUser");
			$role->addChild("adminUser");
			$role->addChild("createCabang");
			$role->addChild("updateCabang");
			$role->addChild("deleteCabang");
			$role->addChild("adminCabang");
			$role->addChild("createMesin");
			$role->addChild("updateMesin");
			$role->addChild("deleteMesin");
			$role->addChild("adminMesin");
			//provide a message indicating success
			echo "Authorization hierarchy successfully generated.";
		}
	}
}