# -*- encoding : utf-8 -*-
class Admin::NewsController < ApplicationController
    before_filter :login_required
    layout 'admin'

   
  def index
    if params[:page]
      @page = params[:page]
    else
      @page = 1
    end
    
    @news_chucks = Exhibition.where("category_id = ?", 4).paginate(:page => @page, :per_page => 10).order('created_at DESC')
  end
  
  def set_current
    @news = Exhibition.find(params[:id])
    @ex_news_chucks = Exhibition.where("category_id = ? AND current = ?", 4, true)
    @ex_news_chucks.each do |ex_news|
      ex_news.current = false
      ex_news.save
    end
    
    if !@news.upcoming
      @news.current = !@news.current
      respond_to do |format|
        if @news.save
          format.html {redirect_to admin_news_index_path, :notice => '성공적으로 변경하였습니다.'}
        else
          format.html {redirect_to admin_news_index_path, :notice => '오류가 발생하였습니다.'}
        end
      end
    else
      @news.upcoming = false
      @news.current = true
      respond_to do |format|
        if @news.save
          format.html {redirect_to admin_news_index_path, :notice => '성공적으로 변경하였습니다.'}
        else
          format.html {redirect_to admin_news_index_path, :notice => '오류가 발생하였습니다.'}
        end
      end
      
    end
    
  end
  
  def new
    @news = Exhibition.new
    @news.title = "title"
    @news.description = "설명을 적어주세요"
    @news.category_id = 4
    @news.save
    
    redirect_to edit_admin_news_path(@news)
  end
  
  
  def set_upcoming
    @news = Exhibition.find(params[:id])
    
    @ex_newss = Exhibition.where("category_id = ? AND upcoming = ?", 4, true)
    @ex_newss.each do |ex_news|
      ex_news.upcoming = false
      ex_news.save
    end    
    
    
    if !@news.current 
      @news.upcoming = !@news.upcoming
      respond_to do |format|
        if @news.save
          format.html {redirect_to admin_news_index_path, :notice => '성공적으로 변경하였습니다.'}
        else
          format.html {redirect_to admin_news_index_path, :notice => '오류가 발생하였습니다.'}
        end
      end
    else
      @news.current = false
      @news.upcoming = true
      
      respond_to do |format|
        if @news.save
          format.html {redirect_to admin_news_index_path, :notice => '성공적으로 변경하였습니다.'}
        else
          format.html {redirect_to admin_news_index_path, :notice => '오류가 발생하였습니다.'}
        end
      end
      
    end
    
    
  end
  
  
  def show
  end
  
  def edit
    @news = Exhibition.find(params[:id])
  end
  
  def update
    @news = Exhibition.find(params[:id])      
    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html {redirect_to admin_news_index_path, :notice => '전시가 성공적으로 수정되었습니다.' }
      else
        format.html {redirect_to admin_news_index_path, :alert => '전시 수정 중 오류가 발생하였습니다.'}
      end
    end
  end
  
  def destroy
    @news = Exhibition.find(params[:id])
    @news.destroy
    
    respond_to do |format|
      format.html {redirect_to request.referer, :notice => '성공적으로 삭제하였습니다.'}
    end
  end

end
