# -*- encoding : utf-8 -*-
class EventsController < ApplicationController
  def index
    @current = Event.where("current = ?", true).first
    @upcoming = Event.where("upcoming = ?", true).first
    
    @events = {}
    @evs = Event.where("current = ? AND upcoming = ?", false, false).order("start_date DESC")
     @years = []
    @evs.each do |ev|
      year = ev.start_date.strftime("%Y")
      @years << year.to_i
      if @events[year.to_s] == nil
        @events[year.to_s] =[]
      end
      @events[year.to_s] << ev
    end
    
    @years.uniq!
    @years.sort! {|a, b| b <=> a}
    
    
  end
  
  def show
    @event = Event.find(params[:id])
  end
end
