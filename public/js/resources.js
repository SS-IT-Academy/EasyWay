function update_resource_fields_div(resource_type_id) {  
  $.ajax({
    url: "/update_fields",
    type: "GET",
    data: {"resource_type_id" : resource_type_id},
    dataType: "json",
    success: function(data) {
      console.log(data);
      $("#fieldsDiv").html(update_resource_parse_data(data));
    }
  }); 
}

function update_resource_parse_data(data){
	data_html="";
	for (var i=0;i<data.length;i++){
	  	data_html+="<div class='control-group'>"+
	  	"<label class='control-label' for='field_"+data[i].name+"'>"+data[i].name+
	  	"</label><div class='controls'><input id='field_"+data[i].name+
	  	"' name='resource[field["+data[i].name+"]]' size='30' type='text'></div></div>"
	}
	return data_html;
}


function resource_type_remove_field(obj){
  $(obj).parent().parent().parent().remove();
}

function resource_type_add_new_field(obj){
  console.log('dsfsdfs');
  $.ajax({
    url: "/get_field_types",
    type: "GET",
    data: {},
    dataType: "json",
    success: function(data) {
    	console.log(update_field_type_parse_data(data));
    	$(obj).parent().parent().before(update_field_type_parse_data(data));
    }
  });
}  
function update_field_type_parse_data(data){
  console.log(data);
  data_html="<div class='control-group'><div class='control-group'>"+
  "<label class='control-label' for='field_name'>Field Name</label><div class='controls'>"+
  "<input name='resource[field][name]' size='30' type='text'>"+
  "<a href='#' class='btn' onclick='resource_type_remove_field(this)'>Remove Field</a></div></div>"+
  "<label class='control-label' for='resource_type_name'>Field Type</label>"+
  "<div class='controls'><select><option>Select Type</option>";
  for(var i=0;i<data.length;i++){
     data_html+="<option id='"+data[i].id+"'>"+data[i].name+"</option>" 	
  }
  data_html+="</div></div></div>";
  return data_html;
}