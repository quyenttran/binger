$(document).ready(function() {
  $('#new-user').on('click', function(event){
    event.preventDefault();
    var $that = $(this);
    var path = $that.attr('href')

    $.ajax({
      url: path,
      dataType: 'json'
    }).done(function(response){
      $('#results-container').empty()
      // $('#search-form').hide()
      $('#results-container').append(response.to_html)
    })
  })

  $('#search-form').on('submit', function(event){
    event.preventDefault();

    var $that = $(this);
    var path = $that.attr('action')
    var data = $that.serialize()
    var verb = $that.attr('method')

    $.ajax({
      method: verb,
      url: path,
      dataType: 'json',
      data: data
    }).done(function(response){
      $('#results-container').empty()
      $that[0].reset();
      $('#results-container').append(response.search)
    })
  })

  $('#login').on('click', function(event){
    event.preventDefault();
    var $that = $(this);
    var path = $that.attr('href')

    $.ajax({
      url: path,
      dataType: 'json'
    }).done(function(response){
      $('#results-container').empty()
      // $('#search-form').hide()
      $('#results-container').append(response.to_html)
    })
  })

  $('#show-user').on('click', function(event){
    event.preventDefault();
    var $that = $(this);
    var path = $that.attr('href')

    $.ajax({
      url: path,
      dataType: 'json'
    }).done(function(response){
      $('#results-container').empty()
      $('#results-container').append(response.to_html)
    })
  })

  $('')
});
