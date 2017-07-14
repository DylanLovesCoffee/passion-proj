$(document).ready(function() {

  $(".formWrapper").on("submit", "#emailSearch", function(){
    $(".formWrapper").append('<div class="loader"></div>')
    setTimeout(function(){console.log('countdown start')}, 9000);
  });

});
