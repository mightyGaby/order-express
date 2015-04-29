//item collection view
var app = app || {};

app.ItemView = Backbone.View.extend({
  initialize: function() {
    this.listenTo( this.model,'change', this.render);
  },
  template: _.template( app.itemTpl ),
  tagName: 'li',
  render: function() {
    var data = this.model.attributes;
    this.$el.html(this.template(data));
    $('body').append(this.$el);
  }
});
