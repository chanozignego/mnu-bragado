$(document).ready(function () {
  $('#birthdatepicker').keydown(function() {
    return false;
  });

  $('#birthdatepicker').datetimepicker({
      viewMode: 'years',
      format: 'DD/MM/YYYY',
      minDate : moment('1900-01-01'),
      maxDate : "now"
  });

  $('#birthdatepicker').click(function(){
    $('#birthdatepicker').datetimepicker("show");    
  })

  $('#birthdatepicker').focus(function(){
    $('#birthdatepicker').datetimepicker("show");    
  })
});
