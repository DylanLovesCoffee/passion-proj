$(document).ready(function() {

  $(".formWrapper").on("submit", "#imageUpload", function(){
    $(".formWrapper").append('<div class="loader"></div>')
    setTimeout(function(){console.log('countdown start')}, 8000);

  });
});
