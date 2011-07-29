# -*- encoding : utf-8 -*-
class ExhibitionsController < ApplicationController
  def index
    @current = Exhibition.where("current = ?", true).first
    @upcoming = Exhibition.where("upcoming = ?", true).first
    @exhibitions = {}
    
    @exs = Exhibition.where("current = ? AND upcoming = ?", false, false).order("start_date DESC")
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
