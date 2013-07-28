$(".form-horizontal").submit(function(){
  var isFormValid = true;
  $(".form-horizontal input:text,.form-horizontal select").each(function(){ 
    if ($.trim($(this).val()).length == 0){
      $(this).addClass("highlight");
      isFormValid = false;
      } 
    else {
      $(this).removeClass("highlight");
    }
  });
  if (!isFormValid) alert("Please fill in all the required fields (highlighted in red)");
  return isFormValid;
});
	