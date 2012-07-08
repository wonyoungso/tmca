# -*- encoding : utf-8 -*-
class MailinglistsController < ApplicationController
  def new
    @mailinglist = Mailinglist.new
    render :layout => false
  end

  def create
    @mailinglist = Mailinglist.new(params[:mailinglist])
    
    respond_to do |format|
      if @mailinglist.save
        format.json {render :json => {:success => true, :message => '성공적으로 메일링 리스트에 등록되었습니다.'}}
      else 
        format.json {render :json => {:success => false}}
      end
    end
  end
  
  def destroy
    @mailinglist = Mailinglist.find_by_token(params[:token])
    respond_to do |format|
      if @mailinglist != nil
        @mailnglist.destroy
        format.html {redirect_to root_path, :notice => '성공적으로 메일링 리스트에서 제거되었습니다.'}
      else
        format.html {redirect_to root_path, :alert => '메일링 리스트에서 제거할 수 없습니다.'}
      end
    end
    
  end
end
