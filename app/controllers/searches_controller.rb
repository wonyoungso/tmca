# -*- encoding : utf-8 -*-
class SearchesController < ApplicationController
  def index
    @exhibitions = Exhibition.where("title LIKE ? or description LIKE ?", params[:query])
    @news = News.where("title LIKE ? or description LIKE ?", params[:query])
    @events = Event.where("title LIKE ? or description LIKE ?", params[:query])
    @educations = Education.where("title LIKE ? or description LIKE ?", params[:query])
    
    respond_to do |format|
      format.html 
      
      #TODO search_by_json으로 통합
      format.json {render :json => {:success => true}}
    end
  end
end
