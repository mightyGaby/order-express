//menu item collection

var app = app || {};

app.ItemCollection = Backbone.Collection.extend({
  url: '/api/items',
  model: app.ItemModel
});
