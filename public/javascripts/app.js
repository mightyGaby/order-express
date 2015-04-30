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


  // app.menuItems.fetch();      //collection fetches data
  app.partyList.fetch();

  $('#party-list').click(function(){
    $('.party-order').toggle();
  });

  $('#table-url').click(function(){
    $('#tables-list').fadeToggle("slow");
  })

  $('#menu-url').click(function(){
    app.menuItems.fetch();      //collection fetches data
    $('#menu-items').show();
    $('#kitchen-view').hide();
    $('#stage').hide();
  })

  $('#kitchen-url').click(function(){
    $('#kitchen-view').show();
    $('#menu-items').hide();
  });



  // $('.tables').on('click', function(){
  //   //display single party view
  //   $('#table-view').toggle();
  // })


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
