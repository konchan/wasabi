// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui-1.8.23.custom.min
//= require twitter/bootstrap
//= require jquery.simple-color-picker
//= require farbtastic
//= require jquery.timepicker
//= require jquery-ui-sliderAccess
//= require jquery.selectboxes
//= require ccchart
//= require_tree .

$(document).ready(function(){
//  $.getJSON("/dashboard/orders_for_each_month/", function(data){ ccchart.init("hoge", data.json); });
  $("#datepicker,#datepicker2,#datepicker3,#datepicker4").datepicker({dateFormat: 'yy-mm-dd'});
//, timeFormat: 'hh:mm z', showTimezone: false, timezoneList: [{"value": "+0900", "label": "JST"}]});
  $("#datetimepicker").datetimepicker({dateFormat: 'yy-mm-dd'});
//, timeFormat: 'hh:mm z', showTimezone: false, timezoneList: [{"value": "+0900", "label": "JST"}]});
//
//  $("#campaign_customer_id").change(function(){
//    var url = '/campaigns/get_drop_down_options/' + $(this).val()
//    $("#campaign_contact_id").removeOption(/./).ajaxAddOption(url);
//  });
//   
//$("#task_campaign_id").change(function(){
//  var url = '/tasks/get_drop_down_options/' + $(this).val()
//  $("#task_activity_id").removeOption(/./).ajaxAddOption(url);
//});
//  
//  $('[name="campaign_id"]').change(function(){
//    $.get('/actions/get_actions_by_campaign/' + $(this).val());
//  });
//  
//  $('#colorpicker').farbtastic('#status_tag_design,#kind_design,#phase_design,#tag_design,#action_kind_design')
});

function entryChange1(){
  list = document.getElementById('campaign_kind_id');
  index = list.selectedIndex;
  if(index == 3) {
    //フォーム
    document.getElementById('selectiveField').style.display = "none";
  } else {
    document.getElementById('selectiveField').style.display = "";
  }
}
