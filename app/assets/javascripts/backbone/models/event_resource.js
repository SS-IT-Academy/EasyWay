EasyWay.Models.EventResource = Backbone.Model.extend({
	urlRoot: '/resources'
});

EasyWay.Collections.EventResource = Backbone.Collection.extend({
	model: EasyWay.Models.EventResource,
	url: '/resources'
});