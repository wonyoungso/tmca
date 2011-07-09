var exhibitionsController = {
  exhibitions: null,
  length: null,
  currentIndex: 0,
  intervalId: null,
  init: function(){
    this.exhibitions = $(".exhibitions");
    this.exhibitions.find(".right").hover(function(e){
    $(this).find(".detailBtn").animate({backgroundColor:'black'});
      $(this).find(".description").animate({top:0}, 400);
    }, function(e){
      $(this).find(".description").animate({top:100}, 400);
      $(this).find(".detailBtn").animate({backgroundColor:'#FCF242'});
    });
    this.exhibitions.find('.right').click(function(e){
      e.preventDefault();
      document.location.href = $(this).find(".detailBtn a").attr("href");
    });
  },
  loadStart: function(){
    this.intervalID = setInterval($.proxy(this.load, this), 500);
  },
  load: function(){
    $(".indicator").remove();
    $(this.exhibitions.get(this.currentIndex)).slideDown(800);
    this.currentIndex++;
    if (this.currentIndex >= this.length)
    {
      clearInterval(this.intervalId);
    }
  }
};
$(document).ready(function(e){
  exhibitionsController.init();
  exhibitionsController.loadStart();
});