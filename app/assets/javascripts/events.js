// function Add_resource_to_event(){
//   $.ajax({
//     url: "/add_event_resources",
//     type: "GET",
//     beforeSend: function ( xhr ) {
//       xhr.setRequestHeader("X-CSRF-Token", $('meta[name=csrf-token]').attr('content'));
//     },
//     data: {},
//     dataType: "json",
//     success: function(data) {
//       $("#fieldsDiv").append(parse_event_resources(data));
//     }
//   }); 	
// }

function check_selected_resource(){
  $('select[name="resources[][value]"] option').attr('disabled',false);
    
    $('select[name="resources[][value]"]').each(function(){
        var $this = $(this);
        $('select[name="resources[][value]"]').not($this).find('option').each(function(){
           if($(this).attr('value') == $this.val())
               $(this).attr('disabled',true);
        });
    });
}

// function parse_event_resources(data){
//   data_html="<div class='control-group'><label class='control-label' name='resources[][value]'>Resource</label>"+
//   "<div class='controls'><select name='resources[][value]' onchange='check_selected_resource()'> <option></option>";
//   for(var i=0;i<data.length;i++){
//     data_html+="<option value="+data[i].id+">"+data[i].description+"</option>";
//   }
//   data_html+="</select><div><a href='#' class='btn' onclick='resource_type_remove_field(this)'>Remove Field</a></div></div></div>";

  

//   return data_html
// }

function event_remove_resource(obj){
  if (confirm("Are you sure")){
    $.ajax({
      url: "/remove_event_resource",
      beforeSend: function ( xhr ) {
        xhr.setRequestHeader("X-CSRF-Token", $('meta[name=csrf-token]').attr('content'));
      },
      type: "POST",
      data: {"id" : $(obj).attr('id')},
      dataType: "json",
      success: function(data) {
        //alert("Success remove "+data.id+" resource");
        $(obj).parent().parent().parent().remove(); 
      }
  	});
  }
}

function Create_event_with_pattern(obj){
  $.ajax({
    url: "/event_based_on",
    type: "GET",
    beforeSend: function ( xhr ) {
      xhr.setRequestHeader("X-CSRF-Token", $('meta[name=csrf-token]').attr('content'));
    },
    data: {"id" : obj.value},
    dataType: "json",
    success: function(data) {
      console.log(data);
      $('#event_name').attr('value', data.event.name);
      $('#event_event_type_id').val(data.event.event_type_id);
      $('#event_start_at').attr('value', data.event.start_at);
      $('#event_duration').attr('value', data.event.duration);
      $('#event_recurrence_id').val(data.event.recurrence_id);
      if (data.resources.length>0)
    	$.each(data.resources, function(){
    	  $('#fieldsDiv').html('<div class="control-group">'+
    	  '<label class="control-label" name="resources[][value]">Event Resource</label>'+
    	  '<div class="controls">'+
    	  '<select id="resources_value" name="resources[][value]"><option>'+this.description+'</option></select>'+
    	  '<div><a href="#" class="btn" onclick="resource_type_remove_field(this)">Remove Field</a></div></div></div>');
    	});
      else $('#fieldsDiv').html('');
    }
  });
}

$(function () {
  $('.datepicker').datetimepicker({
    dateFormat: "yy-mm-dd",
    firstDay: 1,
    controlType: 'select',
    stepMinute: 5
  });
  $("#new_event").validate();
  //$('select').selectpicker();
});