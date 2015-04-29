console.log('its about to go down');

var app = app || {};

$(document).ready(function(){
  // create collections
  app.menuItems = new app.ItemCollection({
    model: app.ItemModel
  });

  app.partyList = new app.PartyCollection({
    model: app.PartyModel
  });

  // //create views
  app.menuDisplay = new app.MenuItemsView({
    modelView: app.ItemView,
    collection: app.menuItems,
    el: $('#menu-items'),
  });

  app.partyDisplay = new app.PartyListView({
    modelView: app.PartyView,
    collection: app.partyList,
    el: $('#party-list'),
  });

  app.menuItems.fetch();      //collection fetches data
  app.partyList.fetch();




  $('#place-order').on('click', function(){  // Creating an event listener

      var partyId = app.partySelection.get('id')       // Obtain the id from the selected party
      var foodId = app.itemSelection.get('id')        // Obtain the id from the selected food
       $.ajax({
         method: 'post',
         url: '/api/orders',
         data: {party_id: partyId, food_id: foodId},
         success: function() {
           console.log()
           app.parties.fetch( {reset: true} );  // Reset the party list... update all data

          //  $('.selected-food').removeClass('selected-food');  // remove selected class for style
          //  $('.selected-party').removeClass('selected-party');  // remove selected class for style
         }
       })


      });

});
