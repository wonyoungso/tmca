# -*- encoding : utf-8 -*-
class Admin::PdfsController < ApplicationController
  def create
       @pdf = Pdf.new
       @pdf.attachment = params[:file]
       @pdf.pdfable_id = params[:pdfable_id]
       @pdf.pdfable_type = params[:pdfable_type]
       if @pdf.save
         respond_to do |format|
           format.json {render :json => {:success => true, :message => 'PDF 업로드가 완료되었습니다.', :pdf => pdf_as_json(@pdf)}}
         end
       else
         respond_to do |format|
           format.json {render :json => {:success => false, :message => 'PDF 업로드가 실패하였습니다.'}}
         end
       end

   end


   def pdf_as_json(pdf)
     pdf = {
       :id => pdf.id,
       :url => pdf.attachment.url,
       :file_name => pdf.photo_file_name
     }
     pdf
   end

end
