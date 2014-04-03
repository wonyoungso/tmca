# -*- encoding : utf-8 -*-
class Pdf < ActiveRecord::Base
  has_attached_file :attachment, 
  :url => '/system/pdfs/:id/:style/:filename',
  :path => '/system/pdfs/:id/:style/:filename',
  :dependent => :destroy
  belongs_to :pdfable, :polymorphic => true
end
