function setRadioChecked(radio_id, checked) {
	console.log(radio_id);
    $("#" + radio_id)[0].checked=checked;
}

function setSelectEnabled(select_id, enabled) {
	console.log(select_id);
	$("#" + select_id)[0].disabled=!enabled;
}

function updateTMapping()  {
    var value = window.event.target.value;
    alert("value = " + value);
}

function updatePropertyMapping(){
	var observer_element = $("#notify_event_observer_id")[0],
	event_element = $("#notify_event_event_id")[0],
	template_element = $("#notify_event_template_id")[0],
	mapping_container = $("#notify_event_property_mapping_container");
	if(template_element.value && (observer_element.value || event_element.value)){
		params = {};
		params['template_id'] = template_element.value;
		params['observer_id'] = observer_element.value;
		params['event_id'] = event_element.value;
		$.ajax({
		    url: "/show_property_mapping_content",
		    data: params,
		    type: "GET",
		    dataType: "html",
		    success: function(html_content) {
		      console.log(mapping_container);
		      
	  	      console.log(html_content);
	  	      mapping_container[0].innerHTML = html_content;
	  	      mapping_container.show();
			}
		});
	} else {
	      mapping_container.hide();
	}
}

//'observer_Observer'         'observer_select'       event_select'           'event_Event'