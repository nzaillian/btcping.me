$ ->
  $('table.clickable-rows tbody tr:not(.empty)').click ->
    window.location = $(this).data('url')