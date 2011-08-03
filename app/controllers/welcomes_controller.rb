# -*- encoding : utf-8 -*-
class WelcomesController < ApplicationController
  def index
    @current_exhibition = Exhibition.where("current = ? AND category_id = ?", true, 1).first
    @current_education = Exhibition.where("current = ? AND category_id = ?", true, 2).first
    @current_event =Exhibition.where("current = ? AND category_id = ?", true, 3).first
  end
end
