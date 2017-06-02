$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  // $("body").on("click", "a.show-link", function(e){
  //   $("div.create-potluck").remove()
  //   e.preventDefault();
  //   var $this = $(this)
  //   $.ajax({
  //     method: "GET",
  //     url: $this.attr("href"),
  //   })
  //     .done(function(response){
  //       console.log(response.html)
  //       $("body").append(response.html)
  //     })
  // })
  $("p.snowball").hide()

  $("#by").change(function() {
    $("div.select-one").remove()
    var data = {by: $("#by :selected").text()}
    $.ajax({
      method: "GET",
      url: "/shows/form",
      data: data
    })
      .done(function(response){
        $("body").append(response)
      })
  })

  $("body").on("click", "button.ok",function(event) {
    window.scrollTo(0, 0)
    $("p.snowball").show()
    $this = $(this)
    var val = {by:$(this).siblings("p").text(), val: $(this).siblings("input.val").val()}
    $.ajax({
      method: "GET",
      url: "/shows/find",
      data: val
    })
      .done(function(response){
        console.log(response)
        $("body").append(response)
        $("p.snowball").hide()
        $this.hide()
      })
  })


  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
