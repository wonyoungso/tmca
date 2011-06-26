# -*- encoding : utf-8 -*-
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
      if target.cropping?  
        logger.info 'sdflisjfliwejilwejfliewifljewlijfweilfwejilfwijlefilj'
        if @attachment.style == 'medium'
          " -crop #{target.crop_medium_width}x#{target.crop_medium_height}+#{target.crop_medium_x}+#{target.crop_medium_y}"  
        elsif @attachment.style == 'thumb'
          " -crop #{target.crop_thumb_width}x#{target.crop_thumb_height}+#{target.crop_thumb_x}+#{target.crop_thumb_y}"
        end  
      end  
    end  
  end  
end
