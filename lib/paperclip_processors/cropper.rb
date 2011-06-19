module Paperclip  
  class Cropper < Thumbnail  
    def transformation_command  
      if crop_command  
        crop_command + super.sub(/ -crop \S+/, '')  
      else  
        super  
      end  
    end  
  
    def crop_command  
      target = @attachment.instance  
      logger.info target
      if target.cropping?  
        " -crop #{target.width_medium}x#{target.height_medium}+#{target.x1_medium}+#{target.y1_medium}"  
      end  
    end  
  end  
end