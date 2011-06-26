# -*- encoding : utf-8 -*-
class MalinglistMailer < ActionMailer::Base
  default :from => "토탈미술관 <no-reply@totalmuseum.org>"
  
  def mailinglist_mail(emails, template)
    @template = template
    @emails = emails
    
    mail(:to => 'no-reply@totalmuseum.org',    
         :bcc => @emails,
         :subject => @template.title)
         
  end
  
end
