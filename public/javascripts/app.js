console.log('models poppin bottles');

var app = {};

//food model
app.Item = Backbone.Model.extend();

//food collection
app.ItemCollection = Backbone.Collection.extend(
  url: '/api/items'
  model: app.Item
);


$(document).ready(function(){
  item = new app.Item();
  menu = new app.ItemCollection();

  item.fetch();
});
