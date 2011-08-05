# -*- encoding : utf-8 -*-
class Admin::SessionsController < ApplicationController
  before_filter :login_required, :only => [:destroy]
  layout 'admin'
  def new
    if !logged_in?
      @user = User.new
      params[:return_to] ||= request.referer
      if request.xhr?
        render :layout => false
      else
        render :layout => 'admin'
      end
    else
      redirect_to admin_exhibitions_path
    end
    
  end
  
  def create
    @user = User.authenticate(params[:login], params[:password])
    if @user
        self.current_user = @user
        @success = true
        respond_to do |format|        
          flash[:notice] = "성공적으로 로그인하였습니다."
          format.html { redirect_to admin_exhibitions_path}
        end
      #end
    else

      @success = false
   
      respond_to do |format|   
        format.html { redirect_to admin_login_path }
      end
    end
  
  end
  
  def destroy
    self.current_user = nil
    
    respond_to do |format|
      format.html {redirect_to root_path, :notice => '로그아웃되었습니다.'}
    end
  end
  
  
end
