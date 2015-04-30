
var app = app || {};

app.TableView = Backbone.View.extend({
  initialize: function() {
    this.listenTo( this.model,'change', this.render);
    this.listenTo( this.model, 'delete', this.remove);
  },
  template: _.template('<li class="tables"><%= id %></li>'),
  render: function() {
    var data = this.model.attributes;
    this.$el.html(this.template(data));
    $('body').append(this.$el);
  },
  events: {
    'click .tables': 'selectTable',
    'tap .tables': 'selectTable',
    },
    selectTable: function(){
      $('.selected-table').removeClass('selected-table')
      this.$el.addClass('selected-table')
      app.tableSelection = this.model;
      console.log(app.tableSelection)
      app.partySelection = app.tableSelection

      var showView = new app.PartyView({
        el: $('#party-stage'),
        model: app.partySelection,
      });

      $('#kitchen-view').hide();
      $('#place-order').show();
      $('#menu-items').show();


      showView.render();
        // Clear the stage
        // Populate all the view
    }

});
