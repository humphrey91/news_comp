// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
  $('.datepicker').datepicker({
   startDate: "05/20/2017",
   endDate: "today",
   autoclose: true,
   todayHighlight: true
  });
});
