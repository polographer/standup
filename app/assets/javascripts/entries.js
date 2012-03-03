$(document).ready(function() {
  // Handler for .ready() called.
  $("#day_selector").datepicker({dateFormat: 'yy-mm-dd'});
  $("#week_selector").datepicker({dateFormat: 'yy-mm-dd'});
  $("#week_selector").change(function(){
	$("#filter_week").submit();
  });
});
