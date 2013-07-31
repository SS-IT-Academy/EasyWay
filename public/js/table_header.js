function addResTypeField(resTypeId) {
	console.log('func')
	$.ajax({
    url: "/get_restype_fields",
    type: "GET",
    beforeSend: function ( xhr ) {
      xhr.setRequestHeader("X-CSRF-Token", $('meta[name=csrf-token]').attr('content'));
    },
    data: {"resource_type_id" : resTypeId},
    dataType: "json",
	success: function(data) {
      console.log(data);
      $("#resTypeField").html(addResTypeParseData(data));
    }
  }); 
}

function addResTypeParseData(data){
	dataHtml="";
	for (var i=0;i<data.length;i++){
	  	dataHtml+="<div class='control-group'>"+
	  					"<div class='controls'><label class='checkbox' for='field_"+data[i].name+"'>"+data[i].name+
	  					"<input type='checkbox' id='field_"+data[i].name+
	  					"' name='resource[field["+data[i].name+"]]' size='30' type='text'></label></div></div>"
	}
	return dataHtml;
}