<cfcomponent name="Queues">
	<cfscript>
		// create object of Configuration CFC
		sqsObject = createObject("component","sqs");

        sqs=sqsObject.AddCloudService()

		 function createQueue (		
			required any queueName
		) access="remote" returnFormat="plain"
		{
			res=''


			try{ 
				myQueue=sqs.createQueue(queueName) 
				res="Standard queue created"
			} 
			catch (any e){ 
			// writeDump(e)
				res=e.message
		
			} 
			return res
		}

		 function listQueues (		
		) access="remote" returnFormat="json"
		{
			res=''


			try{ 
				res=sqs.listQueues().queueUrls 
			} 
			catch (any e){ 
			// writeDump(e)
				res=e.message
		
			} 
			return res
		}


	</cfscript>
</cfcomponent>