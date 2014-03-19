// Models View
EasyWay.Views.EventResources = Backbone.View.extend({
	tagName: 'select',

	initialize: function(){
		this.$el.attr({ name: 'resources[][value]'});
	},

	render: function(){
		this.collection.each(this.addOne, this);
		return this;
	},

	addOne: function(event_resource){
		var eventResource = new EasyWay.Views.EventResource({ model: event_resource });
		this.$el.append(eventResource.render().el);
	}
})

// Collections View
EasyWay.Views.EventResource = Backbone.View.extend({
	tagName: 'option',

	initialize: function(){
		this.$el.attr({ value: this.model.get('id')});
	},

	render: function(){
		this.$el.html(this.model.get('description'));
		return this;
	}

})

var eventResourseCollection = new EasyWay.Collections.EventResource();
eventResourseCollection.fetch();
var eventResourseCollectionView = new EasyWay.Views.EventResources({collection: eventResourseCollection});
//$('#fieldsDiv').append(eventResourseCollectionView.render().el);