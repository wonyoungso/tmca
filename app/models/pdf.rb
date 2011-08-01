# -*- encoding : utf-8 -*-
class Pdf < ActiveRecord::Base
  has_attached_file :attachment, :dependent => :destroy
  belongs_to :pdfable, :polymorphic => true
end
