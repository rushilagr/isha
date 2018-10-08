# $('.date-field').datepicker({ format: 'dd/mm/yyyy' });

$( document ).on 'turbolinks:load', ->
  $('.datepicker').datepicker({ format: 'dd/mm/yyyy' });
