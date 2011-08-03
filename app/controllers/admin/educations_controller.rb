# -*- encoding : utf-8 -*-
class Admin::EducationsController < ApplicationController
  before_filter :login_required
  layout 'admin'
  
  def index
    if params[:page]
      @page = params[:page]
    else
      @page = 1
    end
    
    @exhibitions = Exhibition.where("category_id = ?", 3).paginate(:page => @page).order('start_date DESC')
  end
  
  def set_current
    @exhibitions = Exhibition.all
    @exhibition = Exhibition.find(params[:id])
    @exhibitions.each do |exhibition|
      if exhibition.id != @exhibition.id
        exhibition.current = false
        exhibition.save
      end
    end
    
    if !@exhibition.upcoming
      @exhibition.current = !@exhibition.current
      respond_to do |format|
        if @exhibition.save
          format.html {redirect_to admin_exhibitions_path, :notice => '성공적으로 변경하였습니다.'}
        else
          format.html {redirect_to admin_exhibitions_path, :notice => '오류가 발생하였습니다.'}
        end
      end
    end
  end
  
  def set_upcoming
    @exhibitions = Exhibition.all
    @exhibition = Exhibition.find(params[:id])
    @exhibitions.each do |exhibition|
      if exhibition.id != @exhibition.id
        exhibition.upcoming = false
        exhibition.save
      end
    end
    
    
    
    if !@exhibition.current 
      @exhibition.upcoming =!@exhibition.upcoming
      respond_to do |format|
        if @exhibition.save
          format.html {redirect_to admin_exhibitions_path, :notice => '성공적으로 변경하였습니다.'}
        else
          format.html {redirect_to admin_exhibitions_path, :notice => '오류가 발생하였습니다.'}
        end
      end
    end
    
  end
  
  def create
    @exhibition = Exhibition.new(params[:exhibition])
    @exhibition.category_id = 2
    respond_to do |format|
      if @exhibition.save
        format.html {redirect_to admin_exhibitions_path, :notice => '전시가 성공적으로 생성되었습니다.'}
      else
        format.html {redirect_to admin_exhibitions_path, :alert => '전시 생성이 실패하였습니다.'}
      end
    end
  end
  
  def show
  end
  
  def edit
    @exhibition = Exhibition.find(params[:id])
  end
  
  def update
    @exhibition = Exhibition.find(params[:id])        
    @exhibition.bigphoto.reprocess!
    respond_to do |format|
      if @exhibition.update_attributes(params[:exhibition])
        format.html {redirect_to admin_exhibitions_path, :notice => '전시가 성공적으로 수정되었습니다.' }
      else
        format.html {redirect_to admin_exhibitions_path, :alert => '전시 수정 중 오류가 발생하였습니다.'}
      end
    end
  end
  
  def destroy
    @exhibition = Exhibition.find(params[:id])
    @exhibition.destroy
    
    respond_to do |format|
      format.html {redirect_to admin_exhibitions_path, :notice => '성공적으로 삭제하였습니다.'}
    end
  end
end
