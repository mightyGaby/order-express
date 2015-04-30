//item collection view
var app = app || {};

app.ItemView = Backbone.View.extend({
  initialize: function() {
    this.listenTo( this.model,'change', this.render);
    this.listenTo( this.model, 'delete', this.remove);
  },

  template: _.template('<li class = "items"> <%= name %> </li>'),
  render: function() {
    var data = this.model.attributes;
    this.$el.append(this.template(data));
    return this
  },
  events: {
    'click .items': 'selectItem'
    // 'tap .items': 'selectItem'
    },
    selectItem: function(){
      $('.selected-item').removeClass('selected-item')
      this.$el.addClass('selected-item')
      app.itemSelection = this.model;
      console.log(app.itemSelection)
    }

});
