# -*- encoding : utf-8 -*-
class Exhibition < ActiveRecord::Base
  has_attached_file :bigphoto, :style => {:medium => '320x500#', :thumb => '100x100#'}, :dependent => :destroy
end
