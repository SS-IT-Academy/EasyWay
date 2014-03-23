describe('EasyWay.Views.EventResource', function(){
  it('not null tag',function(){
    var eventResource = new EasyWay.Models.EventResource();
    var eventResourceView = new EasyWay.Views.EventResource({model: eventResource});
    expect(eventResourceView.render().$el.find('option')).not.toBeNull();
  });
});