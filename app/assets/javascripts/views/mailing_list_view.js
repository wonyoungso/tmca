TMCA.views.mailing_list_view = (function(){
  var modal,
      mailing_list_btn,
      mailing_list_join;

  function mailing_list_view(){
    mailing_list_btn = $("#mailing_list_join_btn");
    mailing_list_btn.click(function(e){
      e.preventDefault();

      $.ajax({
        url: '/mailinglists/new',
        type: 'GET',
        success: mailing_list_handler
      })
    });
  }

  function mailing_list_handler(data){
    mailing_list_join = new TMCA.models.MailingListJoin(data);
    mailing_list_join.init();
  }

  return mailing_list_view;
})();
