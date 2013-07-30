function setRadioChecked(radio_id, checked) {
	console.log(radio_id);
	$("#" + radio_id)[0].checked=checked;
}

function setSelectEnabled(select_id, enabled) {
	console.log(select_id);
	$("#" + select_id)[0].disabled=!enabled;
}

function updatePropertyMapping(){
	var notify_observer_element = $("#notify_event_notify_observer_id")[0],
	event_element = $("#notify_event_event_id")[0],
	notify_template_element = $("#notify_event_notify_template_id")[0];
	if(notify_template_element.value && (notify_observer_element.value || event_element.value)){
		params = {};
		params['notify_template_id'] = notify_template_element.value;
		params['notify_observer_id'] = notify_observer_element.value;
		params['event_id'] = event_element.value;
		$.ajax({
		    url: "/show_property_mapping_content",
		    data: params,
		    type: "GET",
		    dataType: "html",
		    success: function(html_content) {
		      console.log(html_content);
               $("#mapping_tbody").html("<tr><td align=\"center\"><b>Notify Template property name</b></td><td align=\"center\"><b>Mapped element</b></td></tr>"
		    	  + html_content);
		      $("#notify_event_property_mapping_container").show();
			}
		});
	} else {
		$("#notify_event_property_mapping_container").hide();
	}
}
//'observer_Observer'         'observer_select'       event_select'           'event_Event'