# -*- encoding : utf-8 -*-
class EventsController < ApplicationController
  def index
    @current = Event.where("current = ?", true).first
    @upcoming = Event.where("upcoming = ?", true).first
    
    @events = {}
    @evs = Event.where("current = ? AND upcoming = ?", false, false).order("start_date DESC")
    @evs.each do |ev|
      year = ev.start_date.strftime("%Y")
      if @events[year.to_s] == nil
        @events[year.to_s] =[]
      end
      @events[year.to_s] << ev
    end
    
  end
  
  def show
    @event = Event.find_by_permalink(params[:permalink])
  end
end
