$(document).ready(function() {
  $("body").on("submit", "#find_city", function(e){
    e.preventDefault();
    var formData = $(this).serialize();
    $(this).trigger("reset");
    // var path = Window.location.pathname;
    // console.log(path)

    $.ajax({
      method: "POST",
      url: "/cities",
      dataType: "json",
      data: formData
    })
      .done(function(response){
        // window.location = "/cities/" + response.id
        $(".divy").append(response.as_html);
        $("#find_city").appendTo(".divy");
      })
  })
});
