function Add_resource_to_event(){
	$.ajax({
    	url: "/add_event_resources",
    	type: "GET",
    	data: {},
    	dataType: "json",
    	success: function(data) {
      		$("#fieldsDiv").append(parse_event_resources(data));
    	}
  	}); 	
}
function parse_event_resources(data){
	data_html="<div class='control-group'><label class='control-label' name=Resources[][value]>Event Resource</label>"+
	"<div class='controls'><select name='Resources[][value]'><option></option>";
	for(var i=0;i<data.length;i++){
		data_html+="<option value="+data[i].id+">"+data[i].description+"</option>";
	}
	data_html+="</select><div><a href='#' class='btn' onclick='resource_type_remove_field(this)'>Remove Field</a></div></div></div>";
	return data_html
}

function event_remove_resource(obj){
	if (confirm("This delete, deletes event Resource.Realy delete?")){
   	$.ajax({
    	url: "/remove_event_resource",
    	type: "POST",
    	data: {"id" : $(obj).attr('id')},
    	dataType: "json",
    	success: function(data) {
    		alert("Success remove "+data.id+" resource");
    		$(obj).parent().parent().parent().remove(); 
    	}
  	});
    
  }
}
