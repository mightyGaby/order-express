var app = app || {};

app.TableListView = Backbone.View.extend({
  initialize: function(options){
    this.modelView = options.PartyView;
    this.listenTo(this.collection,'sync', this.render)
  },
  render: function (){
    var models = this.collection.models
    for (var i in models){
      var singleView = new app.TableView({model: models[i]});
      singleView.render();
      this.$el.append( singleView.$el );
    }
  }
});
