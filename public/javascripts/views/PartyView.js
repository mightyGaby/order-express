
var app = app || {};

app.PartyView = Backbone.View.extend({

  initialize: function() {
    this.listenTo( this.model,'change', this.render);
    this.listenTo( this.model, 'delete', this.remove);
  },

  template: _.template('<div class="party"> <%= name %> party of <%= size %> </div>'),
  render: function() {
    var data = this.model.attributes;
    this.$el.append(this.template(data));
    $('#table-view').append(this.$el);
    this.renderItemsList();
    return this;
  },

  renderItemsList: function(){
    var parties = this.model.get('party')
    var partyList = $('<ul class="party-order">');
    for (i in parties){
      partyList.append($('<li class="party-order-item">').text(items[i]['name']));
    }
    this.$el.append(partyList);
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
