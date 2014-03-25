// Models View
EasyWay.Views.EventResource = Backbone.View.extend({
	tagName: 'option',

	initialize: function(){
		this.$el.attr({ value: this.model.get('id')});
	},

	template: _.template( '<%= description %>' ),

	render: function(){
		var template = this.template(this.model.toJSON());
		this.$el.html(template);
		return this;
	}

})

// Collections View
EasyWay.Views.EventResources = Backbone.View.extend({
	tagName: 'select',

	template: _.template('<br><span class="btn" id="remove_resource">Remove resource</span>'),

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

	template: _.template("<div class='control-group'><label class='control-label' name='resources[][value]'>Resource</label><div class='controls my_res'></div></div>"),

	temp: _.template('<br><span class="btn" id="remove_resource" onclick="event_remove_resource(this)">Remove Field</span>'),

	events: {
		'click': 'addResource',
		'click #remove_resource': 'removeResource'
	},

	removeResource: function(){

	},

	addResource: function(){
		var eventResourseCollectionView = new EasyWay.Views.EventResources({collection: eventResourseCollection});
		$('#fieldsDiv').append(this.template());
		$('.my_res').last().append(eventResourseCollectionView.el).append(this.temp());
	}
})

window.eventResourseCollection = new EasyWay.Collections.EventResource();
eventResourseCollection.fetch();

$(document).ready(function(){	

	var addButton = new EasyWay.Views.AddButton();
})