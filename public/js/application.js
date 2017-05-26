$(document).ready(function() {
  $('body').on("focusout", "input.lyric_lyric", function(event){
    if ($(this).val().length > 0) {
      $(this).css("background-color","yellow")
    }
    else if ($(this).val().length === 0) {
      $(this).css("background-color","white")
    }
  })
});
