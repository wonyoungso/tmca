# -*- encoding : utf-8 -*-
class EventsController < ApplicationController
  def index
    @current = Exhibition.where("current = ? AND category_id = ?", true, 3).first
    @upcoming = Exhibition.where("upcoming = ? AND category_id = ?", true, 3).first
    @exhibitions = {}
    
    
    @exs = Exhibition.where("current = ? AND upcoming = ? AND category_id = ? start_date != ?", false, false, 3, nil).order("start_date DESC")
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
