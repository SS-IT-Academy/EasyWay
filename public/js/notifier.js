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