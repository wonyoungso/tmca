# -*- encoding : utf-8 -*-
class Admin::MailingtemplatesController < ApplicationController
  before_filter :login_required
  layout 'admin'
  
  def index
    @mailingtemplates = Mailingtemplate.all
  end
  
end
