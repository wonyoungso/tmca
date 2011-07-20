var welcomeController = {
  welcomes: null,
  length: null,
  basicWidth: 0,
  currentIndex: 0,
  intervalId: null,
  init: function(){
    this.welcomes = $(".welcome");
    this.length = this.welcomes.length;
    
    
    this.welcomes.hover(function(e){
      $(this).find(".welcomeback").fadeOut(200);
      $(this).find(".detailBtn").animate({backgroundColor:'#434343'});
    }, function(e){
      $(this).find(".welcomeback").fadeIn(200);
      $(this).find(".detailBtn").animate({backgroundColor:'#FCF242'});
    });
    
    this.welcomes.click(function(e){
      e.preventDefault();
      document.location.href = $(this).find(".detailBtn a").attr("href");
    });
  
    this.basicWidth = 960 / this.welcomes.length - 1;
    
    this.welcomes.each($.proxy(this.setWidth, this));
    
  },
  
  setWidth: function(index, item){
    if (index % 2 == 0)
    {
      $(item).find(".welcomback").addClass("black");
    }
    else
    {
      $(item).find(".welcomback").addClass("yellow");
    }
    $(item).css('width', this.basicWidth + 'px');    
  },
  
  loadStart: function(){
    this.intervalID = setInterval($.proxy(this.load, this), 300);
  },
  load: function(){
    $(".indicator").remove();
    $(this.welcomes.get(this.currentIndex)).slideDown(600);
    this.currentIndex++;
    if (this.currentIndex >= this.length)
    {
      clearInterval(this.intervalId);
    }
  }
};


$(document).ready(function(e){
  welcomeController.init();
  welcomeController.loadStart();
});