# -*- encoding : utf-8 -*-
class Admin::MailinglistsController < ApplicationController
  before_filter :login_required
  layout 'admin'
  def index
  
  if params[:page]
      @page = params[:page]
    else
      @page = 1
    end
    
    @mailinglists = Mailinglist.order('created_at DESC').paginate(:page => @page, :per_page => 10)
    
  end
  
  def new
  end
  
  def create
    
    @template = Mailingtemplate.new({
      :title => params[:title],
      :description => params[:description]
    })
    
    @template.save
    
    @attachments = []
    if params[:attachments].present?
      params[:attachments].each do |attachment|
        @attachments << attachment
      end
    end

    Mailinglist.all.each do |user|
      MalinglistMailer.delay.mailinglist_mail(user.email, @template, @attachments) if user.present? and user.email.present? and @template.present? and @attachments.present?
    end
     
    
    respond_to do |format|
      format.html {redirect_to admin_mailinglists_path, :notice => '성공적으로 메일을 보냈습니다.'}
    end
      
  end

  def destroy
    @mailinglist = Mailinglist.find(params[:id])
    @mailinglist.destroy
    redirect_to admin_mailinglists_path, :notice => '성공적으로 삭제했습니다.'

  end
end
