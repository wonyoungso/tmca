# -*- encoding : utf-8 -*-
class Category < ActiveRecord::Base
  has_many :exhibitions
end
