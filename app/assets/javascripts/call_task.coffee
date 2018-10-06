$( document ).on 'turbolinks:load', ->
  $('.search-again-button').click ->
    $('.added-section').addClass('d-none');
    $('.search-form').removeClass('d-none');
