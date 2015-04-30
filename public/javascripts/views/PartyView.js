
var app = app || {};

app.PartyView = Backbone.View.extend({

  initialize: function() {
    this.listenTo( this.model,'change', this.render);
    this.listenTo( this.model, 'delete', this.remove);
  },

  template: _.template('<li class="party"> <%= name %> party of <%= size %> </li>'),
  render: function() {
    var data = this.model.attributes;
    this.$el.append(this.template(data));
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
    $('.selected-party').removeClass('selected-party')
    this.$el.addClass('selected-party')
    app.partySelection = this.model;
    console.log(app.partySelection)
  }
});
