# -*- encoding : utf-8 -*-
class Pdf < ActiveRecord::Base
  has_attached_file :attachment, 
  :url => '/system/attachments/:id/:style/:filename',
  :path => 'public/system/attachments/:id/:style/:filename',
  :dependent => :destroy
  belongs_to :pdfable, :polymorphic => true
end
