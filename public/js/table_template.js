function resourceTypeHeaders(resType, resType2, data){

    var verCount = data.ver_headers.length;

    var horCount = data.hor_headers.length;

    for (var i = 0; i < horCount; i++){
        $(resType).append('<div class="hor-block">'+data.hor_headers[i]+'</div>');
    }

    for (var j = 0; j < verCount; j++){
        $(resType2).append('<div class="ver-block">'+data.ver_headers[j]+'</div>');
    }

}
