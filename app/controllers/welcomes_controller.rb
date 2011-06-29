# -*- encoding : utf-8 -*-
class WelcomesController < ApplicationController
  def index
    @current_exhibition = Exhibition.where("current = ?", true).first
    @current_education = Education.where("current = ?", true).first
    @current_event = Event.where("current = ?", true).first
  end
end
