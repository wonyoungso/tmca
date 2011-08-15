# -*- encoding : utf-8 -*-
include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::TextHelper
class SearchController < ApplicationController
  def index
    if isNumeric(params[:query])
      numeric = params[:query].to_i
      if numeric < 100
        numeric = '19' + params[:query]
      end
      
      @exhibitions = Exhibition.where(:start_date => Date.new(numeric, 1, 1)..Date.new(numeric, 12, 31))
      @news = News.where(:created_at => Date.new(numeric, 1, 1)..Date.new(numeric, 12, 31))
        
    else
      @exhibitions = Exhibition.where("title LIKE ? OR description LIKE ?", "%#{params[:query]}%","%#{params[:query]}%")
      @news = News.where("title LIKE ? OR description LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end
    
    @size = @exhibitions.size + @news.size
    
    respond_to do |format|
      format.json {render :json => {:success => true, :size => @size, :exhibitions => search_by_exhibition_json(@exhibitions), :news => search_by_news_json(@news)}}
    end
  end
  
  def isNumeric(s)
    begin
      Float(s)
    rescue
      false # not numeric
    else
      true # numeric
    end
  end
  
  def search_by_exhibition_json(exhibitions)
    exhibitions_json = []
    exhibitions.each do |exhibition|
      exhibition_json = {
        :title => exhibition.title,
        :description => strip_tags(exhibition.description),
        :category => Exhibition::CATEGORY[exhibition.category_id.to_i],
        :thumbImg => exhibition.currentPhoto(:thumb)
      }
      
      if exhibition.pdfs.size > 0
        exhibition_json[:attachment_link] = exhibition.pdfs.first.attachment.url
      end
      
      exhibitions_json << exhibition_json
    end
    
    return exhibitions_json
    
  end
  
  
  
  def search_by_news_json(news_chunk)
    news_chunk_json = []
    news_chunk.each do |news|
      news_json = {
        :title => news.title,
        :description => truncate(strip_tags(news.description),
        :attachment_url => news.attachment.url,
        :category => 'News',
        :thumbImg => 'news_default.png'
      }
      news_chunk_json << news_json
    end
    
    return news_chunk_json
    
  end
  
end
