# -*- encoding : utf-8 -*-
class InformationsController < ApplicationController
  def index
    @information = Information.first
  end
end
