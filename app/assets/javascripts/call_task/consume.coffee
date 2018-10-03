# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).on 'turbolinks:load', ->
  $('.called-button').click ->
    $('.called-button').addClass('d-none');
    $('.skip-call-button').addClass('d-none');
    $('.submit-section').removeClass('d-none');
