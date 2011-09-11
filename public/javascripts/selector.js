$(document).ready(function(e){
  $(".navigator li a").click(function(e){
    e.preventDefault();
    $(".navigator li a").removeClass("on");
    $(".navigator li a").addClass("off");
    
    $(this).removeClass("off");
    $(this).addClass("on");
    
    var navController = {
      index: 0,
      afterFadeOut: function(e){
        $(".photoSection .photo:eq(" + this.index +  ")").fadeIn();
      }
      
    };
    
    navController.index = $(this).attr("data-id");
    
   
    $(".photoSection .photo").fadeOut(400, $.proxy(navController.afterFadeOut, navController));
    
  });
});
