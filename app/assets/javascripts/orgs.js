$(document).ready(function() {
  "use strict";
  $('#add_new_member').on('ajax:success', function(event, data) {
    $('.members').append(data);
  });
});
