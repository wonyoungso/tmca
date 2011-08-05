# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  #protect_from_forgery
  
  helper :all
  helper_method :logged_in?, :current_user, :login_required
  before_filter :get_first_news
  
  def get_first_news
    @news_header = News.order("created_at DESC").first
  end
  
  
  def login_required
    if !logged_in?
      respond_to do |format|
        format.html { redirect_to root_path, :alert => '로그인이 필요합니다.'}
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
