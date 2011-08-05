# -*- encoding : utf-8 -*-
class News < ActiveRecord::Base
  has_attached_file :attachment 
end
