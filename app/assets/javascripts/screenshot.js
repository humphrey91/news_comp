// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
  $('.datepicker').datepicker({
    startDate: "05/30/2017",
    endDate: "today",
    autoclose:true,
    todayHighlight: true
  });

  $(".js-example-basic-multiple").select2({
    theme: "bootstrap",
    placeholder: "Please select a domain",
    width: "650px"

  });

  var http = require("http");
  setInterval(function() {
    http.get("http://www.frontpagespin.com");
  }, 300000); // every 5 minutes (300000)
});
