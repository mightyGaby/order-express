console.log('models poppin bottles');

var app = app || {};

//      **** TEMPLATES ****

// app.itemTpl = $('#item-temp').html() //this is a function that gets the string format of temp
// app.partyTpl = $('#party-temp').html() //this is a function that gets the string format of temp


//      **** MODELS ****

app.ItemModel = Backbone.Model.extend({});
app.PartyModel = Backbone.Model.extend({});

//      **** COLLECTIONS ****

app.ItemCollection = Backbone.Collection.extend({
  url: '/api/items',
  model: app.ItemModel
});

app.PartyCollection = Backbone.Collection.extend({
  url: '/api/parties',
  model: app.PartyModel
});

//      **** VIEWS ****

//item model view
app.ItemView = Backbone.View.extend({
  initialize: function() {
    this.listenTo( this.model,'change', this.render);
    this.listenTo( this.model, 'delete', this.remove);
  },
  template: _.template('<li class = "items"> <%= name %> </li>'),
  render: function() {
    var data = this.model.attributes;
    this.$el.html(this.template(data));
    $('body').append(this.$el);
  },
  events: {
    'click .items': 'selectItem'
    },
    selectItem: function(){
      this.$el.addClass('selected')
      app.itemSelection = this.model;
      console.log(app.itemSelection)
      alert("DINNER BELL!");
    }

});

//party model view
app.PartyView = Backbone.View.extend({

  initialize: function() {
    this.listenTo( this.model,'change', this.render);
    this.listenTo( this.model, 'delete', this.remove);
  },

  template: _.template('<li class="party"> <%= name %> party of <%= size %> </li>'),
  render: function() {
    var data = this.model.attributes;
    this.$el.html(this.template(data));
    $('body').append(this.$el);
    this.renderItemsList();
    return this;
  },

  renderItemsList: function(){
    var items = this.model.get('items')
    var itemsList = $('<ul class="party-order">');
    for (i in items){
      itemsList.append($('<li class="party-order-item">').text(items[i]['name']));
    }
    this.$el.append(itemsList);
  },

  events:{
    'click .party': 'selectParty'
  },
  selectParty: function(){
    console.log('wtf')
    alert("THIS PARTY IS LITERALLY POPPIN");
  }
});


//item collection view
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

//item collection view

app.PartyListView = Backbone.View.extend({
  initialize: function(options){
    this.modelView = options.PartyView;
    this.listenTo(this.collection,'sync', this.render)
  },
  render: function (){
    var models = this.collection.models
    for (var i in models){
      var singleView = new app.PartyView({model: models[i]});
      singleView.render();
      this.$el.append( singleView.$el );
    }
  }
});

// app.GeneralListView = Backbone.View.extend({
//   initialize: function(options){
//     this.modelView = options.ItemView;
//     this.listenTo(this.collection,'sync', this.render)
//   },
//   render: function (){
//     var models = this.collection.models
//     for (var i in models){
//       var singleView = new this.modelView({model: models[i]});
//       singleView.render();
//       this.$el.append( singleView.$el );
//     }
//   }
// });
