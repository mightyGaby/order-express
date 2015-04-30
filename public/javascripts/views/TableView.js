
var app = app || {};

app.TableView = Backbone.View.extend({
  initialize: function() {
    this.listenTo( this.model,'change', this.render);
    this.listenTo( this.model, 'delete', this.remove);
  },
  template: _.template('<li class = "tables"> <%= name %> </li>'),
  render: function() {
    var data = this.model.attributes;
    this.$el.html(this.template(data));
    $('body').append(this.$el);
  },
  events: {
    'click .tables': 'selectTable'
    // 'tap .items': 'selectItem'
    },
    selectTable: function(){
      $('.selected-table').removeClass('selected-table')
      this.$el.addClass('selected-table')
      app.tableSelection = this.model;
      app.partySelection = app.tableSelection


    }

});
