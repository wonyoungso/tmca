# -*- encoding : utf-8 -*-
class Admin::InformationsController < ApplicationController
  layout 'admin'
  before_filter :login_required
  
  def index
    @information = Information.first 
    if @information == nil
      @information = Information.new
      @information.save
    end
    
  end
  
  def edit
    @information = Information.first
  end
  
  def update
    @information = Information.first
    respond_to do |format|
      if @information.update_attributes(params[:information])
        format.html {redirect_to admin_informations_path, :notice => '성공적으로 정보를 수정하였습니다.'}
      else
        format.html {redirect_to admin_informations_path, :alert => '정보 수정 중 오류가 발생하였습니다.'}
      end
    end
  end      
end
