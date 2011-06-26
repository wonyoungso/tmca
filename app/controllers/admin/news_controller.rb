# -*- encoding : utf-8 -*-
class Admin::NewsController < ApplicationController
    before_filter :login_required
    layout 'admin'

    def index
      @news_chucks = News.order('created_at DESC')
    end

    def create
      @news = News.new(params[:news])
      respond_to do |format|
        if @news.save
          format.html {redirect_to admin_news_index_path, :notice => '전시가 성공적으로 생성되었습니다.'}
        else
          format.html {redirect_to admin_news_index_path, :alert => '전시 생성이 실패하였습니다.'}
        end
      end
    end

    def show
    end

    def edit
      @news = News.find(params[:id])
    end

    def update
      @news = News.find(params[:id])
      
      respond_to do |format|
        if @news.update_attributes(params[:news])
          format.html {redirect_to admin_news_index_path, :notice => '전시가 성공적으로 수정되었습니다.' }
        else
          format.html {redirect_to admin_news_index_path, :alert => '전시 수정 중 오류가 발생하였습니다.'}
        end
      end
    end

    def destroy
      @news = News.find(params[:id])
      @news.destroy

      respond_to do |format|
        format.html {redirect_to admin_news_index_path, :notice => '성공적으로 삭제하였습니다.'}
      end
    end

end
