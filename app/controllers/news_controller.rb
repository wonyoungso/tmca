# -*- encoding : utf-8 -*-
class NewsController < ApplicationController
  def index
    @latest_news = News.order("created_at DESC").first
    @news_chunks = News.order("created_at DESC")
  end
  
  def show
    @news = News.find(params[:id])
  end
end
