# -*- encoding : utf-8 -*-
class Picture < ActiveRecord::Base
  has_attached_file :photo, :styles => {:medium => '320x500#', :thumb => '100x100#'}, :dependent => :destroy  
end
