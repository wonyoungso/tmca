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
    @mailinglists = Mailinglist.all
    @emails = @mailinglists.map(&:email).join(", ")
    
    @template = Mailingtemplate.new({
      :title => params[:title],
      :description => params[:description]
    })
    
    @template.save
    
    @attachments = []
    params[:attachments].each do |attachment|
      @attachments << attachment
    end
    
    
     
    MalinglistMailer.mailinglist_mail(@emails, @template, @attachments).deliver
    
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
