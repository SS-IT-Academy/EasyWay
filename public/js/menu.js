function add_create_buttons_to_menu(obj){ 
	if ($(".Create").length != 0){ 
		/*location.reload();*/
		$(".Create").remove();
		$(".close").remove();
		$('.nav li').attr('class', '').children('a').attr('class', '').attr('data-toggle', '');
		$(obj).html("Edit menu");
	}	
	
	else {	
	$('.nav li').each(function(){
		if ($(this).attr('class')!='Create')
			if ($(this).attr('id')!='edit_menu')
			$(this).append('<button type="button" class="close" onclick="delete_menu_element(this)">&times;</button>');	
	
	});
	$('.nav li').attr('class', 'dropdown').children('a').attr('class', 'dropdown-toggle').attr('data-toggle', 'dropdown');	
	$('.nav').first().append('<li class="Create"><a class="Create" href="/menus/new?id=">Create+</a></li>');
	$('.dropdown-menu').each(function(){
		$(this).append('<li class="Create"><a  class="Create" href="/menus/new?id='+$(this).parent().attr('id')+'">Create+</a></li>');		
	});
	
	
	$(obj).html("Finish Edit");
		}	
		
}
$(function (){
	$('.draggables').sortable();	
});	
function delete_menu_element(obj){
  	$.ajax({
    url: "/delete_menu_item",
    type: "GET",
    data: {"menu_item_id" : $(obj).parent().attr('id')},
    dataType: "json",
    success: function(data) {
      $(obj).parent().remove();
    }
  }); 
}

