$(document).ready(function(){
  $("input#wish_content").keyup(function(event) {
    var chars = $(this).val().length;

    if (chars < 10) {
      $('span#char-label').text('Characters to go')
      $('span#chars').text(10 - chars)
    } else if (chars == 1) {
      $('span#char-label').text('')
    } else {
      $('span#char-label').text('Characters remaining')
      $('span#chars').text(140 - chars)
    }
  });
});