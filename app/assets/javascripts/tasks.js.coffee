# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("#task_campaign_id").change ->
    url = '/tasks/' + $(@).val() + '/get_drop_down_options_of_activities/'
    $("#task_activity_id").removeOption(/./).ajaxAddOption(url)
  $("#task_customer_id").change ->
    url = '/tasks/' + $(@).val() + '/get_drop_down_options_of_campaigns/'
    $("#task_campaign_id").removeOption(/./).ajaxAddOption(url)
