# -*- encoding : utf-8 -*-
class Admin::InstallsController < ApplicationController
  layout 'admin'
  def new
    @user = User.find_by_login("admin@totalmuseum.org")
    respond_to do |format|
      if @user != nil
        format.html {redirect_to root_path, :alert => '관리자 계정이 이미 생성되어 있습니다.'}
      else
        format.html
      end
    end
  end
  
  def create
    @user = User.new
    @user.login = 'admin@totalmuseum.org'
    @user.password = params[:password]
    
    respond_to do |format|
      if @user.save
        format.html {redirect_to admin_login_path, :notice => '성공적으로 관리자 계정을 생성하였습니다.'}
      else
        format.html {redirect_to request.referer, :alert => '관리자 계정 생성이 실패하였습니다.'}
      end
    end
    
  end
end
