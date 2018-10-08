$( document ).on 'turbolinks:load', ->
  $('.called-button').click ->
    $('.called-section').addClass('d-none');
    $('.submit-section').removeClass('d-none');
