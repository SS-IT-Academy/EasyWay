$("#new_bookmark").submit(function(){
  var isFormValid = true;
  $("#new_bookmark input:text").each(function(){ 
    if ($.trim($(this).val()).length == 0){
      $(this).addClass("highlight");
      isFormValid = false;
      } 
    else {
      $(this).removeClass("highlight");
    }
  });
  return isFormValid;
});
	