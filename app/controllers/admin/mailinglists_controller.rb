# -*- encoding : utf-8 -*-
class Admin::MailinglistsController < ApplicationController
  before_filter :login_required
  layout 'admin'
  def index
    @mailinglists = Mailinglist.all
  end
  
  def new
  end
  
  def create
    @template = MailingTemplate.find(params[:malingtemplate_id])
    @emails = @malinglists.map(&:email).join(", ")
     
    MalinglistMailer.mailinglist_mail(@emails, @template).deliver
    
    respond_to do |format|
      format.html {redirect_to admin_mailinglists_path, :notice => '성공적으로 메일을 보냈습니다.'}
    end
      
  end
end
