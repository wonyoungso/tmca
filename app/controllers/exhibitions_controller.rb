# -*- encoding : utf-8 -*-
class ExhibitionsController < ApplicationController
  def index
    @current = Exhibition.where("current = ? AND category_id = ?", true, 1).first
    @upcoming = Exhibition.where("upcoming = ? AND category_id = ?", true, 1).first
    @exhibitions = {}
    
    @exs = Exhibition.where("current = ? AND upcoming = ? AND category_id = ? AND start_date IS NOT NULL", false, false, 1, nil).order("start_date DESC")
    @years = []
    @exs.each do |ex|
      logger.info ex.title
      year = ex.start_date.strftime("%Y")
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
    @exhibition = Exhibition.find(params[:id])
  end
end
