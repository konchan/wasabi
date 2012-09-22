# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $.getJSON("/dashboard/orders_for_each_month/"+document.body.clientWidth, (data1)->
    ccchart.init("salesgraph", data1));
  $.getJSON("/dashboard/acts_for_each_month/"+document.body.clientWidth, (data2)->
    ccchart.init("actgraph", data2);)