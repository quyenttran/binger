$(document).ready(function() {
  $('.main-nav').on('click', '#new-user', function(event){
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

  $('.main-nav').on('submit', '#search-form', function(event){
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

  $('.main-nav').on('click', '#login', function(event){
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

  $('.main-nav').on('click', '#show-user', function(event){
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

  $('#results-container').on('submit', '#login-submit', function(event){
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
      $('#results-container').append(response.to_html)
      $('.main-nav').empty()
      $('.main-nav').append(response.nav)
    })
  })

  $('#results-container').on('submit', '#new-user-form', function(event){
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
      $('#results-container').append(response.to_html)
      $('.main-nav').empty()
      $('.main-nav').append(response.nav)
    })
  })

  $('.main-nav').on('click', '#logout', function(event){
    event.preventDefault();
    var $that = $(this);
    var path = $that.attr('href')

    $.ajax({
      url: path,
      dataType: 'json'
    }).done(function(response){
      $('#results-container').empty()
      $('.main-nav').empty()
      $('.main-nav').append(response.nav)
    })
  })
});
