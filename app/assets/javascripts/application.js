// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require recurring_select
//= require_tree .

	function addRecipient() {
		alert("Add Clicked")
	}

$(function(){
	$("#permission_roles_content").on("change", "#roles_id", function(e){
	  $.ajax({
	    url: "/permission_roles",
	    type: "GET",
	    data: {"role_id" : $(this).val()},
	    success: function(data) {
	      $("#permission_roles_content").html(data);
	    }
	  }); 
	});

	$("#permission_roles_content").on("change", ".resource-type-row input", function(e){
		var td = $(this).closest("td");
		var tr = td.closest("tr");
		var index = tr.indexOf(td);

		tr.closest("tbody").find("td:eq("+index+")").find("input").prop("checked", true);
	});
});