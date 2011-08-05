# -*- encoding : utf-8 -*-
class EducationsController < ApplicationController
  def index
    @current = Exhibition.where("current = ? AND category_id = ?", true, 2).first
    @upcoming = Exhibition.where("upcoming = ? AND category_id = ?", true, 2).first
    @exhibitions = {}
    
    @exs = Exhibition.where("current = ? AND upcoming = ? AND category_id = ?", false, false, 2).order("start_date DESC")
    @years = []
    @exs.each do |ex|
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
