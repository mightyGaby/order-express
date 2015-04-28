console.log('models poppin bottles');

var app = app || {};

//      **** TEMPLATES ****

app.itemTpl = $('#item-temp').html() //this is a function that gets the string format of temp


//      **** MODELS ****

app.ItemModel = Backbone.Model.extend({});

//      **** COLLECTIONS ****

app.ItemCollection = Backbone.Collection.extend({
  url: '/api/items',
  model: app.ItemModel
  });


//      **** VIEWS ****

//model view
app.ItemView = Backbone.View.extend({
  initialize: function() {
    // this.listenTo( this.model,'change', this.render);
    console.log('hey!')
  },
  template: _.template( app.itemTpl ),
  tagName: 'li',
  render: function() {
    var data = this.model.attributes;
    this.$el.html(this.template(data));
    $('body').append(this.$el);
  }
});

//collection view

app.MenuItemsView = Backbone.View.extend({
  initialize: function(options){
    this.modelView = options.ItemView;
    this.listenTo(this.collection,'sync', this.render)
  },
  render: function (){
    var models = this.collection.models
    for (var i in models){
      var singleView = new app.ItemView({model: models[i]});
      singleView.render();
      this.$el.append( singleView.$el );
    }
  }
});


$(document).ready(function(){

  app.menuItems = new app.ItemCollection({
    model: app.ItemModel
  });

  app.menuDisplay = new app.MenuItemsView({
    modelView: app.ItemView,
    collection: app.menuItems,
    el: $('#menu-items'),
  });

app.menuItems.fetch();      //collection fetches data
});
