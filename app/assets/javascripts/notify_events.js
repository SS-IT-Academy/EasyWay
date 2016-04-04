function setRadioChecked(radio_id, checked) {
	$("#" + radio_id)[0].checked = checked;
}

function setSelectEnabled(select_id, enabled) {
	$("#" + select_id)[0].disabled =! enabled;
}


function setReset(select_id) {
    $("#" + select_id).prop('selectedIndex', 0);
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


function updatePropertyOfSelect(select, by_resource){
	if( (select.selectedOptions[0].getAttribute("complex") != "true") ) return;
	destroyNextSiblings(select);
	var url = ((by_resource === true) ? "/show_property_by_resource" : "/show_property_by_resource_value");

	if(select.value){
		params = {};
		params['id'] = select.value;
		$.ajax({
		    url: url,
		    data: params,
		    type: "GET",
		    dataType: "html",
		    success: function(html_content) {
		    	var tmpContainer = document.createElement("DIV");
		    	tmpContainer.innerHTML = html_content;
		    	nextSelect = tmpContainer.children[0];
		    	select.parentNode.appendChild(nextSelect);
			}
		});
	} else {
		$("#notify_event_property_mapping_container").hide();
	}
	
}

function destroyNextSiblings(sibling){
	var nextSiblings = [];
	var nextEl = sibling;
	while(nextEl = nextEl.nextSibling){
		nextSiblings.push(nextEl); 
	}	
	console.log(nextEl);
	for( var i=0; i <  nextSiblings.length; i++){
		nextSiblings[i].parentNode.removeChild(nextSiblings[i])
	}	
}
//'observer_Observer'         'observer_select'       event_select'           'event_Event'
