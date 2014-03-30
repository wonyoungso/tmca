# -*- encoding : utf-8 -*-
class Picture < ActiveRecord::Base
  has_attached_file :photo, :styles => {
    :main => "320x520", 
    :medium => '320x500#', 
    :thumb => '100x100#'
  }, 
  :path => '/photos/:id/:style/:filename',

  :dependent => :destroy 
   
  belongs_to :pictureable, :polymorphic => true
end
