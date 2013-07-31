function resourceTypeHeaders(resType, data){	
	var v = data.ver_headers.length > 0? data.ver_headers.length : 0;
	var h = data.hor_headers.length > 0? data.hor_headers.length : 0;
	
	if((v == 1 && h == 1) && (v == 1 || h == 1)){
		v = 110; 	
	}
	else if(v > h){
		v = v * 110;
	}
	else if(v < h){
		v = h * 110;
	}
	else{
	}
	 				
	$(resType).height(v);
	$(resType).width(v);
		
	var height = $(resType).height();
	var width = $(resType).width();
	
	var verCount = data.ver_headers.length > 0? data.ver_headers.length : 0;
	var verDeltaWidth = width/verCount;
	var verDeltaHeight = height/verCount;
	
	var horCount = data.hor_headers.length > 0? data.hor_headers.length : 0;
	var horDeltaWidth = width/horCount;
	var horDeltaHeight = height/horCount;
		
	for (var i = 0; i<verCount; i++){
		$(resType).append('<div class="ver-triangle-box shadow1"><div id="ver-triangle"></div><div id="ver-block">'+data.ver_headers[i]+'</div></div>');
		$(resType).find('.ver-triangle-box').last().css({width:(width-verDeltaWidth*i)+'px', height:(height-verDeltaHeight*i)+'px'})
		.find('#ver-triangle').css('border-bottom-width',(width-verDeltaWidth*i)+'px').css('border-right-width',(width-verDeltaWidth*i)+'px');				
	}	
	for (var i = 0; i<horCount; i++){
		$(resType).append('<div class="hor-triangle-box shadow2"><div id="hor-triangle"></div><div id="hor-block">'+data.hor_headers[i]+'</div></div>');
		$(resType).find('.hor-triangle-box').last().css({width:(width-horDeltaWidth*i)+'px', height:(height-horDeltaHeight*i)+'px'})
		.find('#hor-triangle').css('border-top-width',(width-horDeltaWidth*i)+'px').css('border-left-width',(width-horDeltaWidth*i)+'px');
	}
	$(resType).append('<div class="hor-triangle-box-add"><div id="hor-add"></div></div>');	
	$(resType).append('<div class="ver-triangle-box-add"><div id="ver-add"></div></div>');
	
	if (data.hor_headers.length == 1) {
		$(resType).find('#hor-block').css('line-height','110px');
	}	
}
