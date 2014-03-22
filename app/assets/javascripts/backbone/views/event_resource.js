// Models View
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

// Collections View
EasyWay.Views.EventResources = Backbone.View.extend({
	tagName: 'select',

	initialize: function(){
		this.$el.attr({ name: 'resources[][value]'});
		this.render();
	},

	render: function(){
		this.collection.each(this.addOne, this);
		return this;
	},

	addOne: function(event_resource){
		var eventResource = new EasyWay.Views.EventResource({ model: event_resource });
		this.$el.append(eventResource.render().el);
	}

});

// Add button view
EasyWay.Views.AddButton = Backbone.View.extend({
	el: '#add_resource',

	initialize: function(){
		
	},

	events: {
		'click': 'addResource'
	},

	addResource: function(){
		var eventResourseCollectionView = new EasyWay.Views.EventResources({collection: eventResourseCollection});
		$('#fieldsDiv').append(eventResourseCollectionView.el);
	}
})

window.eventResourseCollection = new EasyWay.Collections.EventResource();
eventResourseCollection.fetch();

$(document).ready(function(){	

	var addButton = new EasyWay.Views.AddButton();
})