	function add_recipient(){
	$.ajax({
	    url: "/get_recipients",
	    type: "GET",
	    data: {},
	    dataType: "json",
	    success: function(data) {
  	      console.log(data);
	  	  add_html="<div class='form-inline'><select><option></option>";
	  	  for(var i=0; i<data.length;i++){
	  		add_html+="<option value='"+data[i].id+"'>"+data[i].username+"</option>"  
	  	  }
		  add_html+="</select><a href='#' onClick='remove_field_recipient(this)'>Remove</a></div>";
		  $("#marginforforms").append(add_html);	    }
	  }); 
}

function remove_field_recipient(obj){
	$(obj).parent().remove();
}

function notify_observer_property_add_new_field(){
	field_html='<div class="control-group">'+
    '<label class="control-label" for="notify_observer_property_name">Name</label>'+
    '<div class="controls">'+
    '<input id="notify_observer_property_name" name="notify_observer_property[name]" size="30" type="text">'+
    '</div><a href="#" onClick="notify_observer_property_remove_field(this)">Remove</a></div>';
	$('#notify_observer_property_fields').append(field_html);
}

function notify_observer_property_remove_field(obj){
	$(obj).parent().remove();
}

jQuery(function ($) {
	  window.NestedFormEvents.prototype.insertFields = function(content, assoc, link) {
	    if($(link).hasClass('insert_in_table')){
	      return $(content).insertBefore($(link).parent().parent());
	    }
	    else{
	      return $(content).insertBefore(link);
	    }
	  };
	});

function notify_observer_add_new_field(){
	field_html='<div class="control-group">'+
    '<label class="control-label" for="notify_observer_notify_observer_properties">Notify observer property</label>'+
    '<div class="controls">'+
    '<input id="notify_observer_name" name="notify_observer[name]" type="text" size="30">'+
    '</div><a href="#" onClick="notify_observer_remove_field(this)">Remove</a></div>';
	$('#notify_observer_fields').append(field_html);
}

function notify_observer_remove_field(obj){
	$(obj).parent().remove();
}


function add_notify_template_mapping(){
	$.ajax({
    url: "/get_notify_template_mappings",
    type: "GET",
    data: {},
    dataType: "json",
    success: function(data) {
	      console.log(data);
      var add_html="<tr><td><input id='notify_event_name' type='text'></input></td><td><select><option></option>";
  	  for(var i=0; i<data.length;i++){
  		add_html+="<option value='"+data[i].id+"'>"+data[i].name+"</option>"  
  	  }
	  add_html+="</select></td></tr><a href='#' onClick='remove_field_notify_template_mapping(this)'>Remove</a></div>";
	  $("#mappings").append(add_html);	    }
  }); 
}

function remove_field_notify_template_mapping(obj){
$(obj).parent().remove();
}