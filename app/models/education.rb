# -*- encoding : utf-8 -*-
class Education < ActiveRecord::Base
  has_attached_file :bigphoto, :styles => {:medium => '320x500#', :thumb => '100x100#'}, :dependent => :destroy  #
end
