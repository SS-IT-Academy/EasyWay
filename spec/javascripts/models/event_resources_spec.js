describe('EasyWay.Models.EventResource', function(){

	it('model should be defined', function(){
  	expect(EasyWay.Models.EventResource).toBeDefined();
  });

  beforeEach(function(){
    this.eventResource = new EasyWay.Models.EventResource();
  });

  it('model can be instantiated', function(){  	
  	expect(this.eventResource).not.toBeNull();
  });

  it('model should not have this attribute', function(){
    expect(this.eventResource.get('name')).toBeFalsy();
  });

});

describe('EasyWay.Collections.EventResource', function(){

	it('collection should be defined', function() {
  	expect(EasyWay.Collections.EventResource).toBeDefined();
  });

  beforeEach(function(){
    this.eventResources = new EasyWay.Collections.EventResource();
  });

	it('collection can be instantiated', function(){
		expect(this.eventResources).not.toBeNull();
	});

});