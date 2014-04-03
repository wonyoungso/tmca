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
    
    @attachments = params[:attachments]
    @attachment_filenames = []

    @attachments.each_with_index do |attachment, idx|
      File.open("#{Rails.root.to_s}/tmp/#{attachment.original_filename}", "wb") do |f|
        f.write attachment.read
      end

      @attachment_filenames <<  {
        tempfile_path: "#{Rails.root.to_s}/tmp/#{attachment.original_filename}",
        original_filename: attachment.original_filename,
        content_type: attachment.content_type
      }
    end


    Mailinglist.all.each do |user|
      MalinglistMailer.delay.mailinglist_mail(user.email, @template, @attachment_filenames) if user.present? and user.email.present? and @template.present?
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
