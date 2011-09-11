$(document).ready(function(e){
  $(".navigator li a").click(function(e){
    e.preventDefault();
    $(".navigator li a").removeClass("on");
    $(".navigator li a").addClass("off");
    
    $(this).removeClass("off");
    $(this).addClass("on");
  });
});
