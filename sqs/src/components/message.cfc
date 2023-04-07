<cfcomponent name="Messages">
	<cfscript>
		// create object of Configuration CFC
		sqsObject = createObject("component","sqs");

        sqs=sqsObject.AddCloudService()

		 function sendMessage (		
			required any queueName,
			required any message

		) access="remote" returnFormat="plain"
		{
			res=''


			try{ 
				queueNm = sqs.createQueue(queueName);  
                queueUrl = queueNm.getQueueUrl(); 

                sendMessageResp = sqs.sendMessage(queueUrl,message);
				if(sendMessageResp.sdkHttpResponse.statusCode ==200) 
				{
					res="Message was sent successfully!"

				}else{
					res="Message sending failed!"

				}
			} 
			catch (any e){ 
			// writeDump(e)
				res=e.message
		
			} 
			return res
		}

		 function pollMessages (	
		 required any queueName
	
		) access="remote" returnFormat="json"
		{
			res=''


			try{ 
				queueNm = sqs.createQueue(queueName);  
                queueUrl = queueNm.getQueueUrl(); 

				setQueueAttributesMetadata = { 
				"attributes"={ 
				"ReceiveMessageWaitTimeSeconds"="20" 
				} 
				}; 
				setQueueAttributesResponse = myQueue.setAttributes(setQueueAttributesMetadata);  
				
				longPollingVal=myQueue.getAttributes({"attributeNames"=["ReceiveMessageWaitTimeSeconds"]}); 
				res=longPollingVal.attributes["ReceiveMessageWaitTimeSeconds"];
			} 
			catch (any e){ 
			// writeDump(e)
				res=e.message
		
			} 
			return res
		}


	</cfscript>
</cfcomponent>