# -*- encoding : utf-8 -*-
class EducationsController < ApplicationController
  def index
    @current = Exhibition.where("current = ? AND category_id = ?", true, 2).first
    @upcoming = Exhibition.where("upcoming = ? AND category_id = ?", true, 2).first
    @exhibitions = {}
    
    
    @exs = Exhibition.where("current = ? AND upcoming = ? AND category_id = ? AND start_date IS NOT NULL", false, false, 2).order("start_date DESC")
    @years = []
    @exs.each do |ex|
      logger.info ex
      year = ex.start_date_rescued.strftime("%Y")
      @years << year.to_i
      if @exhibitions[year.to_s] == nil
        @exhibitions[year.to_s] =[]
      end
      @exhibitions[year.to_s] << ex
    end
    
    @years.uniq!
    @years.sort! {|a, b| b <=> a}
    
    
    
  end
  
  
  def show
    @education = Exhibition.find(params[:id])
  end
end
