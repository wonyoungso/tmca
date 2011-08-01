class Pdf < ActiveRecord::Base
  has_attached_file :attachment, :dependent => :destroy
end
