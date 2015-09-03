# -*- encoding : utf-8 -*-
class Pdf < ActiveRecord::Base
  has_attached_file :attachment, 
  :url => '/system/attachments/:id/:style/:filename',
  :path => 'public/system/attachments/:id/:style/:filename',
  :dependent => :destroy

  # validates_attachment_content_type :attachment, :content_type => ["application/unknown", "application/x-hwp", "application/haansofthwp", "application/vnd.hancom.hwp", "application/pdf", "application/octet-stream"]
  

  do_not_validate_attachment_file_type :attachment

  belongs_to :pdfable, :polymorphic => true
end
