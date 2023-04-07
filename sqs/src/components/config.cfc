<cfcomponent name="config">
	<cfscript>
		//APP Settings
		this.accessKeyId = application.accessKeyId;
		this.secretAccessKey = application.secretAccessKey;

		this.alias = application.alias;
		this.vendorName = "AWS";
		this.defaultRegionName = "us-east-1";

        this.cfAdmin = "your cf admin user name"; 
        this.cfAdminPassword = "your cf admin password"; 

	</cfscript>

</cfcomponent>