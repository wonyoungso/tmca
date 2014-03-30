# -*- encoding : utf-8 -*-
class MalinglistMailer < ActionMailer::Base
  default :from => "토탈미술관 <no-reply@totalmuseum.org>"
  
  def mailinglist_mail(email, template, attachs)
    @template = template
    @email = email
    
    if attachs.present?
      attachs.each do |attach|
        if attach.content_type == 'image/png' || attach.content_type == 'image/gif' || attach.content_type == 'image_jpg'
          attachments.inline[attach.original_filename] = File.read(attach.tempfile)
        else
          attachments[attach.original_filename] = File.read(attach.tempfile)
        end
      end
    end 
    
    mail(:to => 'receiver@totalmuseum.org',    
         :bcc => @email,
         :subject => @template.title)
         
  end
  
end
