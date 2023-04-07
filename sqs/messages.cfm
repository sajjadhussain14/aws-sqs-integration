<cfinclude template = "./includes/header.cfm">

<cfscript>
queueObject = createObject("component","src.components.queue");
queueList={}
try{
queueList=queueObject.listQueues()
} catch(any e){}
</cfscript>
	<cfoutput>
		<div class="container">
		<h2 class='w-100 text-center'>Manage Messages</h2>
		<h6 class='w-100 text-center'>Create a Message</h6>

<div class="row m-2">
  <div class="col-3">Queue Name</div>
  <div class="col-9">
  <input type="text" class="col-9" id="queue-name-value" value="Test Queue" />
  </div>
</div>

<div class="row m-2">
  <div class="col-3">Message</div>
  <div class="col-9">    
  <textarea class="form-control" id="message-value" rows="5">
  {  
   "messageBody"="This is a sample message",  
   "messageAttributes"={ 
    "timestamps"="#dateTimeFormat(now())#", 
    "geospatial_data"="San Francisco", 
    "signatures"="ADBE", 
    "identifiers"="ColdFusion" 
   } 
  } 
  </textarea>
</div>
</div>




<div id="message-alert" class="alert alert-info m-3 d-none" role="alert">
</div>

<hr class="m-2">

<div class="row ">
  <div class="col-2 offset-7">
  <button type="submit" class="btn btn-secondary" onclick=sendMessage()>Send Message</button>
  </div>
    <div class="col-2">
  <button type="submit" class="btn btn-secondary ">Cancel</button>
  </div>


</div>


		<h3 class='w-100 text-center mt-3'>Read Messages</h3>
<div class="row m-2">
  <div class="col-3">Queue Name</div>
  <div class="col-9">
  <input type="text" class="col-9" id="queue-name-value-to-read" value="" />
  </div>
</div>

<div class="row m-2">
  <div class="col-3 offset-6">
  <button type="submit" class="btn btn-secondary" onclick=readMessages()>Read Messages</button>
  </div>
    <div class="col-2">
  <button type="submit" class="btn btn-secondary ">Cancel</button>
  </div>


</div>

<div id="message-alert-read-list" class="alert alert-info m-3 " role="alert">
</div>


		</div>
	</cfoutput>
<cfinclude template = "./includes/footer.cfm">
    
