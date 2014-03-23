describe('EasyWay.Views.EventResource', function(){

  it('call render method in model view',function(){
    var eventResource = new EasyWay.Models.EventResource();
    var eventResourceView = new EasyWay.Views.EventResource({model: eventResource});
    spyOn(eventResourceView, 'render');
    eventResourceView.render();
    expect(eventResourceView.render).toHaveBeenCalled();
  });

});

describe('Easy.Views.EventResource', function(){

  beforeEach(function(){
    this.eventResource  = new EasyWay.Collections.EventResource();
    this.eventResourseCollectionView = new EasyWay.Views.EventResources({collection: eventResourseCollection});
  });

  it('call render method in collection view',function(){  
    spyOn(this.eventResourseCollectionView, 'render');
    this.eventResourseCollectionView.render();
    expect(this.eventResourseCollectionView.render).toHaveBeenCalled();
  });

  it('call addOne method in collection view',function(){
    spyOn(this.eventResourseCollectionView, 'addOne');
    this.eventResourseCollectionView.addOne();
    expect(this.eventResourseCollectionView.addOne).toHaveBeenCalled();
  });

});