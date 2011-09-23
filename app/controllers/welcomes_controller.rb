# -*- encoding : utf-8 -*-
class WelcomesController < ApplicationController
  def index
    @currents = Current.order("idex ASC")
  end
end
