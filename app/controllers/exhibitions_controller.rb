# -*- encoding : utf-8 -*-
class ExhibitionsController < ApplicationController
  def index
    @current = Exhibition.where("current = ?", true).first
    @upcoming = Exhibition.where("upcoming = ?", true).first
    @exhibitions = {}
    
    @exs = Exhibition.where("current = ? AND upcoming = ?", false, false).order("start_date DESC")
    @exs.each do |ex|
      year = ex.start_date.strftime("%Y")
      if @exhibitions[year.to_s] == nil
        @exhibitions[year.to_s] =[]
      end
      @exhibitions[year.to_s] << ex
    end
    logger.info @exhibitions
  end
  
  
  def show
    @exhibition = Exhibition.find_by_permalink(params[:permalink])
  end
end
