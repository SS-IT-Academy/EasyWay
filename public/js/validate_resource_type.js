$(document).ready(function(){

	// Validate
	// http://bassistance.de/jquery-plugins/jquery-plugin-validation/
	// http://docs.jquery.com/Plugins/Validation/
	// http://docs.jquery.com/Plugins/Validation/validate#toptions
		$('#new_resource_type').validate({
	    rules: {
	      'resource_type[name]': {
	        minlength: 2,
	        required: true
	      },
	      'fields[][name]':{
	      	minlength: 2,
	        required: true
	      },
	      'fields[][field_type_id]':{
	      	required: function () {
                   if ($("select[value='']")) {
                       
                       return false;
                   } else {
                       return true;
                   }
               }
	      }
	      
	    },
			highlight: function(element) {
				$(element).closest('.control-group').removeClass('success').addClass('error');
			},
			success: function(element) {
				element
				.text('OK!').addClass('valid')
				.closest('.control-group').removeClass('error').addClass('success');
			}
	  });

});