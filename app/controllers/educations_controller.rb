# -*- encoding : utf-8 -*-
class EducationsController < ApplicationController
  def index
    @current = Education.where("current = ?", true).first
    @upcoming = Education.where("upcoming = ?", true).first@exhibitions = {}
    
    @educations = {}
    @eds = Education.where("current = ? AND upcoming = ?", false, false).order("start_date DESC")
    @years = []
    
    @eds.each do |ed|
      year = ed.start_date.strftime("%Y")
      @years << year.to_i
      if @educations[year.to_s] == nil
        @educations[year.to_s] =[]
      end
      @educations[year.to_s] << ed
    end
    
    @years.uniq!
    @years.sort! {|a, b| b <=> a}
    
  end
  
  def show
    @education = Education.find(params[:id])
  end
end
