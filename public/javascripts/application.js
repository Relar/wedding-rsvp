$(function() {
  //$('#flash').delay(5000).fadeOut();
});

$('.input.hint input').live('blur', function() {
  if($(this).val() != '') {
    $(this).addClass('set');
  } else {
    $(this).removeClass('set');
  }
});
