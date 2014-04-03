# -*- encoding : utf-8 -*-
class Picture < ActiveRecord::Base
  has_attached_file :photo, :styles => {
    :main => "320x520", 
    :medium => '320x500#', 
    :thumb => '100x100#'
  }, 
  :url => '/system/photos/:id/:style/:filename',
  :path => '/system/photos/:id/:style/:filename',

  :dependent => :destroy 
   
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  belongs_to :pictureable, :polymorphic => true
end
