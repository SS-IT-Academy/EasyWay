$(function () {
﻿  cache = {};
  $('#ResourceTable tr').hover( 
    function () { 
      $(this).data('focused','true'); 
      var link = $(this);
      var id = $(this).children(":first").html();
	  if(id in cache){
        $('#popup-header').html(cache[id].id+"   "+cache[id].description+cache[id].type);
        $('#popup-main').html(cache[id].values);
        $('#popup').css({'display': 'block'}).stop().animate({left: 0,opacity: 1},300);
        console.log('using cache');
      }
	  else{
		$.ajax({ 
          url:'/resource_info',
		  type:'POST',
		  dataType:'json',
		  data:({'id': id}),
		  success: function(response){ 
		    if(response){
			  if(link.data('focused') == 'true'){
			    $('#popup-header').html(response.resource.id+"  "+response.resource.description+"<br>Type: "+response.resource_type);
			    var values="";
				for (i=0;i<response.values.length;i++){
				  values += '<b>'+response.field_names[i]+"</b>:  ";
				  if (response.values[i].value)
				    values+= response.values[i].value+"</br>";
				  else values+= response.values[i].resource_reference_id+"</br>";
			    }
			    $('#popup-main').html(values); 
			    cache[response.resource.id] = {'id':response.resource.id,'description':response.resource.description,'values':values, "type":"<br>Type: "+response.resource_type};
			    $('#popup').css({'display': 'block'}).stop().animate({left: 0,opacity: 1},300);
			  }
			}
		  }
		});
	  }
    },
    function(){ 
      $(this).data('focused','false');
      $('#popup').stop().animate({
	    left: '-50px',opacity: 0}, 200, function(){
	      $('#popup').css({'display': 'none'});
	     }
	  );
    }
  );
});

