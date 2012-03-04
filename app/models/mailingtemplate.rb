# -*- encoding : utf-8 -*-
class Mailingtemplate < ActiveRecord::Base
  validate :title, :description, :presence => true
  
  before_save :vol_increase
  
  def vol_increase
    self.vol = Mailingtemplate.all.size
  end
  
end
