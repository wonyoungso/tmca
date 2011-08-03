# -*- encoding : utf-8 -*-
class Admin::PicturesController < ApplicationController
  def create

       @picture = Picture.new
       @picture.photo = params[:file]
       @picture.pictureable_id = params[:pictureable_id]
       @picture.pictureable_type = params[:pictureable_type]
       if @picture.save
         respond_to do |format|
           format.json {render :json => {:success => true, :message => '그림 업로드가 완료되었습니다.', :picture => picture_as_json(@picture)}}
         end
       else
         respond_to do |format|
           format.json {render :json => {:success => false, :message => '그림 업로드가 실패하였습니다.'}}
         end
       end

   end
   



   def delete_files
     failed_id = []
     params[:picture_ids].each do |pic_id|
       @picture = Picture.find(pic_id)
       if logged_in?
         @picture.destroy
       else
         failed_id << pic_id
       end
     end

     respond_to do |format|
       format.json { render :json => {:success => true}}
     end
   end


   def picture_as_json(picture)
     picture = {
       :id => picture.id,
       :url => picture.photo.url,
       :file_name => picture.photo_file_name
     }
     picture
   end

  
end
