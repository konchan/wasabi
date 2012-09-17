# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#activity_customer_id").change ->
    url = '/activities/' + $(@).val() + '/get_drop_down_options_of_campaigns/'
    $("#activity_campaign_id").removeOption(/./).ajaxAddOption(url)
