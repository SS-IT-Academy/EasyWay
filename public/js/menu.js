function add_create_buttons_to_menu(){
	$('.nav').first().append('<li><a href="http://localhost:3000/menus/new?id=">Create+</a></li>');
	$('.dropdown').each(function(){
		$('.dropdown-menu').append('<li><a href="http://localhost:3000/menus/new?id='+$(this).attr("id")+'">Create+</a></li>');
	});
	
}
