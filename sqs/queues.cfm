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
		<h2 class='w-100 text-center'>Manage Queues</h2>
		<h6 class='w-100 text-center'>Create a Queue</h6>

<div class="row">
  <div class="col-3">Queue Name</div>
  <div class="col-9"><input type="text" class="col-9" id="queue-name-value" /></div>
</div>


<div id="queue-alert" class="alert alert-info m-3 d-none" role="alert">
</div>

<hr class="m-2">

<div class="row ">
  <div class="col-2 offset-8">
  <button type="submit" class="btn btn-secondary" onclick=createAQueue()>Create a Queue</button>
  </div>
    <div class="col-2">
  <button type="submit" class="btn btn-secondary ">Cancel</button>
  </div>


</div>


		<h3 class='w-100 text-center mt-3'>All Queus</h3>
		<cfdump var=#queueList#>
		</div>
	</cfoutput>
<cfinclude template = "./includes/footer.cfm">
    
