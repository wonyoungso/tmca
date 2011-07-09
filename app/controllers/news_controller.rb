# -*- encoding : utf-8 -*-
class NewsController < ApplicationController
  def index
    @latest_news = News.order("created_at DESC").first
    @news_chunks = News.order("created_at DESC")
    @news_chunks = @news_chunks[1..@news_chunks.length - 1]
  end
  
  def show
    
    @news_chunks = News.order("created_at DESC")
    @news = News.find(params[:id])
  end
end
