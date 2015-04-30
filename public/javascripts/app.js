console.log('its about to go down');

var app = app || {};

$(document).ready(function(){
  $('#menu-items').hide();

  // create collections
  app.menuItems = new app.ItemCollection({
    model: app.ItemModel
  });

  app.partyList = new app.PartyCollection({
    model: app.PartyModel
  });

  // //create views
  app.menuDisplay = new app.GeneralListView({
    modelView: app.ItemView,
    collection: app.menuItems,
    el: $('#menu-items'),
  });

  app.tableDisplay = new app.TableListView({
    modelView: app.TableView,
    collection: app.partyList,
    el: $('#table-list'),
  });

  app.partyOrderDisplay = new app.GeneralListView({
    modelView: app.PartyView,
    collection: app.partyList,
    el: $('#party-list'),
  });


  app.menuItems.fetch();      //collection fetches data
  app.partyList.fetch();

  $('#party-list').click(function(){
    $('.party-order').toggle();
  });

  $('#table-url').click(function(){
    $('#tables-list').fadeToggle("slow");
  });

  $('#kitchen-url').click(function(){
    $('#kitchen-view').show();
    $('#party-list').show();
    $('party-stage').hide();
    $('#menu-items').hide();

  });

  $('#menu-url').click(function(){
    $('#kitchen-view').hide();
    $('#party-list').hide();
    $('#menu-items').show();
  });


  $('#place-order').on('click', function(){  // Creating an event listener

      var partyId = app.partySelection.get('id')       // Obtain the id from the selected party
      var itemId = app.itemSelection.get('id')        // Obtain the id from the selected food

       $.ajax({
         method: 'post',
         url: '/api/orders',
         data: {order: {party_id: partyId, item_id: itemId}},
         success: function() {
           app.parties.fetch( {reset: true} );  // Reset the party list... update all data
           $('.selected-food').removeClass('selected-food');  // remove selected class for style
           $('.selected-party').removeClass('selected-party');  // remove selected class for style
         }
       })

      });

});
