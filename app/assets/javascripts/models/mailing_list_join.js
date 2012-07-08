TMCA.models.MailingListJoin = (function(){
  function MailingListJoin(data){
    this.view = $(data);
    this.modal = $("<div/>", {'class': 'md', 'id': 'mdMailingList'});
    this.modal_back = $("<div/>", {'class': 'mdBack'});
    this.close_btn = this.view.find('.close_btn');
    this.submit_btn = this.view.find('#submit_btn');
  }

  MailingListJoin.prototype = {
    init: function(){

      this.modal_back = this.modal_back.appendTo($('body'));
      this.modal = this.modal.appendTo($("body"));
      this.view = this.view.appendTo(this.modal);
    this.form = this.view.find('form#new_mailinglist');

      this.close_btn.click(_.bind(function(e){
        e.preventDefault();
        this.view.remove();
        this.modal.remove();
        this.modal_back.remove();
      }, this));

      this.submit_btn.click(_.bind(function(e){
        e.preventDefault();
        $.ajax({
          type: 'POST',
          url: this.form.attr('action') + '.json',
          data: this.form.serialize(),
          success: _.bind(this.success_mailing_list_handler, this)
        });
      }, this));
    },

    success_mailing_list_handler: function(data){
      if (data.success){
        $('.mailing_list_form').remove();
        this.form.remove();
        this.view.empty();
        this.view.append($("<a href='#' class='close_btn'>x</a><div>성공적으로 가입되었습니다!</div>"));
        this.close_btn = this.view.find('.close_btn');
        this.close_btn.click(_.bind(function(e){
          e.preventDefault();
          this.view.remove();
          this.modal.remove();
          this.modal_back.remove();
        }, this));
      } else {
        alert("이미 가입되어 있거나 이메일 주소가 잘못되었습니다. ");
      }

    }
  }

  return MailingListJoin;
})();