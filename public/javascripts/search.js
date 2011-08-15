var searchController = {
  success: function(data){
    if (data.size == 0)
    {
      //검색결과가 없습니다.
    }
    else
    {
      for (var i = 0; i < data.exhibitions.length; i++)
      {
        $("#searchResultTemplate").tmpl(data.exhibitions[i]).appendTo($("#searchWrap"));
      }
      
    
      for (var i = 0; i < data.news.length; i++)
      {
        $("#searchResultTemplate").tmpl(data.exhibitions[i]).appendTo($("#searchWrap"));
      }
    }
  }
};
$(document).ready(function(e){
  $("#searchBtn").click(function(e){
    e.preventDefault();

    $("#searchWrap").slideToggle();
  });
  
  $(".searchTextField").keyup(function(e){
    if (e.keyCode == 13)
    {
      if ($(this).val().length > 2)
      {
        $.ajax({
          type: 'GET',
          url: '/search.json?query=' + $(this).val(),
          success: $.proxy(searchController.success, searchController)
        });
      }
    }
  })
  
});