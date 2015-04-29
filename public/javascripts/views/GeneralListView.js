app.GeneralListView = Backbone.View.extend({
  initialize: function(options){
    this.modelView = options.ItemView;
    this.listenTo(this.collection,'sync', this.render)
  },
  render: function (){
    var models = this.collection.models
    for (var i in models){
      var singleView = new this.modelView({model: models[i]});
      singleView.render();
      this.$el.append( singleView.$el );
    }
  }
});
