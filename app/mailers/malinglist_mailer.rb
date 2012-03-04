# -*- encoding : utf-8 -*-
class MalinglistMailer < ActionMailer::Base
  default :from => "토탈미술관 <no-reply@totalmuseum.org>"
  
  def mailinglist_mail(emails, template, attachs)
    @template = template
    @emails = emails
    
    
    attachs.each do |attach|
      if attach.content_type == 'image/png' || attach.content_type == 'image/gif' || attach.content_type == 'image_jpg'
        attachments.inline[attach.original_filename] = File.read(attach.tempfile)
      else
        attachments[attach.original_filename] = File.read(attach.tempfile)
      end
    end
    
    mail(:to => 'receiver@totalmuseum.org',    
         #:bcc => @emails,
         :bcc => 'bizarre@bizarre07.com',
         :subject => @template.title)
         
  end
  
end
