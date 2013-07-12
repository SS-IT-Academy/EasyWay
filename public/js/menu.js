function add_create_buttons_to_menu(){
	$('.nav').first().append('<li><a href="#" onclick="add_new_menu_item()">Create+</a></li>');
	$('.dropdown-menu').append('<li><a href="#" onclick="add_new_menu_item()">Create+</a></li>');
}

function add_new_menu_item(){
	popup = window.open("/new_popup", "", "height=450, width=700, top=300, left=300, scrollbars=1");
}