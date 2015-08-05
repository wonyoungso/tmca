# -*- encoding : utf-8 -*-
class NewsController < ApplicationController
  def index

    @latest_news = Exhibition.where(category_id: 4).order("created_at DESC").first
    @news_chunks = Exhibition.where(category_id: 4).order("created_at DESC")
    @news_chunks = @news_chunks[1..@news_chunks.length - 1]
  end
  
  def show
    
    @news_chunks = Exhibition.where(category_id: 4).order("created_at DESC")
    @news = Exhibition.find(params[:id])
  end
end
