$(document).ready(function(e){
  $(".navigator li a").click(function(e){
    e.preventDefault();
    $(".navigator li a").removeClass("on");
    $(".navigator li a").addClass("off");
    
    $(this).removeClass("off");
    $(this).addClass("on");
    
    var index = $(this).attr("data-id");
   
    $(".photoSection .photo").fadeOut(400, {idx : index}, function(e){
      $(".photoSection .photo:eq(" + idx +  ")").fadeIn();
    });
    
  });
});
