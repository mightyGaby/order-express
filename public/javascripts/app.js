console.log('models poppin bottles');

var app = app || {};
app.TestTemplate = $('#temp').html() //this is a function that gets the string format of temp
//food model
app.ItemModel = Backbone.Model.extend({});

//food collection
app.ItemCollection = Backbone.Collection.extend(
  url: '/api/items',
  model: app.ItemModel
);

//what is the data to display?
//what element is being displayed?
//what is the template to be used?

app.ItemView = Backbone.View.extend(
  initialize: {
    this.listenTo(this.model,'change', this.render);
  },
  template: _.template(app.TestTemplate),
  tagName: 'li',
  render: {
    var data = this.model.attributes;
    this.$el.append(this.template(data));
    return this;
  }
)

app.MenuView = Backbone.View.extend(
  initialize: function(options){

  },
  render: function (){
    var models = this.collection.models

  }

)


$(document).ready(function(){
  app.MenuView = new app.ItemCollection({
    model: app.ItemModel
  });

  app. = new app.CollectionView({
    modelView: app.PartyView,
    collection: app.MenuView,
    el: $('#party-list'),
  });

  app.item.fetch();
});
