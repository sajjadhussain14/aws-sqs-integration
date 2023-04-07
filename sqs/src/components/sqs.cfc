<cfcomponent name="sqs">
	<cfscript> 

		app = createObject("component","config");

		public function AddCloudService() 
		{
			
			// define credentials struct 
			awsCred  =
			{ 
				"alias" : app.alias, 
				"vendorName" : app.vendorName, 
				"region" : app.defaultRegionName, 
				"accessKeyId" :  app.accessKeyId,
				"secretAccessKey" : app.secretAccessKey
            } 

			// define configuration struct 
			awsConf =
			{ 
				"alias" : app.alias, 
				"serviceName" : "SQS" 
			}

			// Create an object of administrator component and call the login method 
			adminObj = createObject("component","cfide.adminapi.administrator") 
			adminObj.login(adminpassword=app.cfAdminPassword,adminuserid=app.cfAdmin) 
			
			// Create an object of cloud component 
			cloudObj = createObject("component","cfide.adminapi.cloud") 

           	// ADD CREDENTIALS TO CF ADMIN
			try{ 
				cloudObj.addCredential(awsCred) 
				writeDump("Credentials added successfully") 
			} 
			catch(any e){ 
				//writeDump(e.message) 
			} 

			// add config configStruct 
			try{ 
				cloudObj.addServiceConfig(awsConf) 
				writeOutput("Configuration service added successfully") 
			} 
			catch(any e){ 
				//writeDump(e.message) 
			} 

			sqs=getCloudService(awsCred,awsConf) 

			return sqs
		}

	</cfscript>
 </cfcomponent>