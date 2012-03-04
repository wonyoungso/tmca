# -*- encoding : utf-8 -*-
class Exhibition < ActiveRecord::Base
  belongs_to :category
  has_many :pictures, :as => :pictureable, :dependent => :destroy
  has_many :pdfs, :as => :pdfable, :dependent => :destroy
   # attr_accessor :crop_medium_x, :crop_medium_y, :crop_medium_width, :crop_medium_height, :crop_thumb_x, :crop_thumb_y, :crop_thumb_width, :crop_thumb_height
    # after_update :reprocess_bigphoto, :if => :cropping?  
    # 
    # def cropping?  
    #   !crop_medium_x.blank? && !crop_medium_y.blank? && !crop_medium_width.blank? && !crop_medium_height_blank? && !crop_thumb_x_blank? && !crop_thumb_y.blank? && !crop_thumb_width.blank? && !crop_thumb_height.blank?
    # end  
    # 
    # private  
    # def reprocess_bigphoto
    #   bigphoto.reprocess!  
    # end
  CATEGORY = {1 => 'Exhibition', 2 => 'Education', 3 => 'Event'}
    
  def currentPhoto(varient = nil)
    if self.pictures.first != nil
      self.pictures.first.photo.url(varient)
    else
      "default_exhibition.png"
    end
  end
  
  def is_main?
    Current.where(:exhibition_id => self.id).count > 0
  end
      
  def start_date_rescued
    if self.start_date.present?
      self.start_date
    else
      DateTime.now
    end
  end
  
  def end_date_rescued
    if self.end_date.present?
      self.end_date
    else
      DateTime.now
    end
    
  end
  
end
