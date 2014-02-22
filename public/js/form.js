$(".content  .form-horizontal").submit(function(){
  var isFormValid = true;
  $(".content .form-horizontal input:text,.content .form-horizontal select[disabled!='disabled'],.content .form-horizontal input:password").each(function(){ 
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
	