$(document).ready(function() {

  $(".formWrapper").on("submit", "#emailSearch", function(e){
    e.preventDefault();
    $(".formWrapper").fadeOut();
    $("#page-wrapper").append('<div class="loader"></div>')
    setTimeout(function(){
      console.log('countdown start');
    }, 9000);
    var $form = $(this)
    $.ajax({
      url: $form.attr('action'),
      method: $form.attr('method'),
      data: $form.serialize()
    }).done(function(data){
      $("#page-wrapper").empty();
      $("#page-wrapper").append(data);
    });
  });

});
