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

      // Obtain the id from the selected party
       // Obtain the id from the selected food

    // make an ajax call
        // to make a new order
         //  the route to hit
        // data to make order
        // Reset the party list... update all data

        // remove selected class for style
         // remove selected class for style

      });

});
