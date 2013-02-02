$(document).ready(function() {
  "use strict";

  $('#add_new_member').on('ajax:success', function(event, data) {
    $('.members').append(data);
  });

  $(document).on('click', 'input[data-toggle-src]', function(event) {
    var src = $(event.target).data('toggle-src');
    var disabled = !$(event.target).prop('checked');

    $('div[data-toggle-dest=' + src + '] :input').each(function (index, el) {
      $(el).prop('disabled', disabled);
      if (disabled) {
        $(el).val('');
      }
    });
  });
});
