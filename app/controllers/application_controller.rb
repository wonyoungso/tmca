# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper :all
  
  
  def login_required
    if !logged_in?
      respond_to do |format|
        format.html { 
          begin
            redirect_to request.referer, :alert => '로그인을 해주세요'
          rescue
           redirect_to login_path, :alert => '로그인을 해주세요'
          end
        }
        format.json { render :json => {:success => false, :message => '로그인이 필요합니다' } }
      end
    end
  end
  

  
  def logged_in?
    current_user != :false
  end

  def current_user
    
    @current_user ||= (session[:user] && User.find_by_id(session[:user])) || :false
  end

  def current_user= user
    session[:user] = user.is_a?(User) ? user.id : nil
    @current_user = user
  end

end
