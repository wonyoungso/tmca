$(document).ready(function(e){
  $(".navigator li a").click(function(e){
    e.preventDefault();
    $(".navigator li a").removeClass("on");
    $(".navigator li a").addClass("off");
    
    $(this).removeClass("off");
    $(this).addClass("on");
    
    var navController = {
      index: 0,
      currentPhoto: null,
      afterFadeOut: function(e){
        $(".photoSection .photo.current").removeClass('current');
        $(".photoSection").animate({height: $(".photoSection .photo:eq(" + this.index +  ")").height()}, 200, $.proxy(this.fadeInCurrent, this));    
       
      },
      fadeInCurrent: function(e){
         $(".photoSection .photo:eq(" + this.index +  ")").fadeIn(400, function(e){
          $(this).addClass('current');

        });
      }
      
    };
    
    navController.index = $(this).attr("data-id");
    navController.currentPhoto = $(".photoSection .photo.current");
    
   
    $(".photoSection .photo.current").fadeOut(400, $.proxy(navController.afterFadeOut, navController));
    
  });
});
