function add_create_buttons_to_menu(obj){ 
		parent = $(obj).parents(".navbar");

		if ($(parent).find(".Create").length != 0){ 
			location.reload();
			/*$(parent).find(".Create").remove();
			$(parent).find(".close").remove();
			$(parent).find('.nav li').attr('class', '').children('a').attr('class', '').attr('data-toggle', '');
			$(obj).html("Edit menu");*/
		}
		else {	
		
			$(parent).find('.nav li').each(function(){
				if ($(this).attr('class')!='Create')
					if ($(this).attr('id')!='edit_menu')
					$(this).append('<button type="button" class="close" onclick="delete_menu_element(this)">&times;</button>');	
			
			});
			$(parent).find('.nav li').attr('class', 'dropdown').children('a').attr('class', 'dropdown-toggle').attr('data-toggle', 'dropdown');	
			$(parent).find('.nav').first().append('<li class="Create"><a class="Create" href="/menus/new?id=">Create+</a></li>');
			$(parent).find('.dropdown-menu').each(function(){
				$(this).append('<li class="Create"><a  class="Create" href="/menus/new?id='+$(this).parent().attr('id')+'">Create+</a></li>');		
			});
			
			if ($(obj).parents(".content").length>0){
				$(parent).find(".Create a").attr("href",'#').attr("onClick","create_new_menu_element(this)");
			}
	
			$(obj).html("Finish Edit");
		}	
}
	
function create_new_menu_element(obj){
	if ($(obj).parents(".dropdown").attr('id'))
		parent=$(obj).parents(".dropdown").attr('id');
	else parent='';
	$.ajax({
    url: "/render_form_for_menu",
    type: "POST",
    data: {
      "parent_id": parent,
      "role_id": $('#menu_role_id option:selected').val()
    },
    dataType: "html",
    success: function(data) {
     $('#menuForm').html(data);
    }
  });
}




$(function (){
$('.draggables').sortable();
});
function delete_menu_element(obj){
  	$(obj).parent().attr('id')
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

function getUrl(){
	var currentUrl = window.location;
	$('#url').val(currentUrl);
}
function renderForm(val){
	$.ajax({
    url: "/render_menu",
    type: "GET",
    data: {"role_id": val},
    dataType: "html",
    success: function(data) {
     $('#menuManage').html(data);
    }
  }); 
	
}
