EasyWay.Models.Event = Backbone.Model.extend({
	urlRoot: '/add_event_resources'
});
EasyWay.Collections.Events = Backbone.Collection.extend({
	model: EasyWay.Models.Event
})