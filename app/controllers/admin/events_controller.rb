# -*- encoding : utf-8 -*-
class Admin::EventsController < ApplicationController
   before_filter :login_required
   layout 'admin'

   def index
     if params[:page]
       @page = params[:page]
     else
       @page = 1
     end
     
     ExpWeblogTitle.all.each do |weblog_title|
       entry_id = weblog_title.entry_id.to_i
       if ExpCategoryPost.find_by_entry_id(entry_id).cat_id == 6
         
         if weblog_title.year.to_i < 2000
           @exhibition = Exhibition.new
           @exhibition.title = weblog_title.title
           descData = ExpWeblogData.find_by_entry_id(entry_id)
           @exhibition.description = descData.field_id_1 + descData.field_id_2 + descData.field_id_3
           @exhibition.start_date = Date.new(weblog_title.year.to_i, weblog_title.month.to_i, weblog_title.day.to_i)
           @exhibition.end_date = Date.new(weblog_title.year.to_i, weblog_title.month.to_i, weblog_title.day.to_i)
         end
         
       end
     end
     

     @exhibitions = Exhibition.where("category_id = ?", 3).paginate(:page => @page).order('start_date DESC')
   end

   def set_current
      @exhibition = Exhibition.find(params[:id])
      @ex_exhibitions = Exhibition.where("category_id = ? AND current = ?", 3, true)
      @ex_exhibitions.each do |ex_exhibition|
        ex_exhibition.current = false
        ex_exhibition.save
      end

      if !@exhibition.upcoming
        @exhibition.current = !@exhibition.current
        respond_to do |format|
          if @exhibition.save
            format.html {redirect_to admin_events_path, :notice => '성공적으로 변경하였습니다.'}
          else
            format.html {redirect_to admin_events_path, :notice => '오류가 발생하였습니다.'}
          end
        end
      end
    end

    def new
      @exhibition = Exhibition.new
      @exhibition.title = "title"
      @exhibition.description = "설명을 적어주세요"
      @exhibition.category_id = 1
      @exhibition.save

      redirect_to edit_admin_exhibition_path(@exhibition)
    end


    def set_upcoming
      @exhibition = Exhibition.find(params[:id])
      @exhibition = Exhibition.find(params[:id])
      @ex_exhibitions = Exhibition.where("category_id = ? AND current = ?", 3, true)
      @ex_exhibitions.each do |ex_exhibition|
        ex_exhibition.upcoming = false
        ex_exhibition.save
      end    


      if !@exhibition.current 
        @exhibition.upcoming =!@exhibition.upcoming
        respond_to do |format|
          if @exhibition.save
            format.html {redirect_to admin_events_path, :notice => '성공적으로 변경하였습니다.'}
          else
            format.html {redirect_to admin_events_path, :notice => '오류가 발생하였습니다.'}
          end
        end
      end

    end

   def create
     @exhibition = Exhibition.new(params[:exhibition])
     @exhibition.category_id = 3
     respond_to do |format|
       if @exhibition.save
         format.html {redirect_to admin_events_path, :notice => '전시가 성공적으로 생성되었습니다.'}
       else
         format.html {redirect_to admin_events_path, :alert => '전시 생성이 실패하였습니다.'}
       end
     end
   end

   def show
   end

   def edit
     @exhibition = Exhibition.find(params[:id])
   end

   def update
     @exhibition = Exhibition.find(params[:id])   
     respond_to do |format|
       if @exhibition.update_attributes(params[:exhibition])
         format.html {redirect_to admin_events_path, :notice => '전시가 성공적으로 수정되었습니다.' }
       else
         format.html {redirect_to admin_events_path, :alert => '전시 수정 중 오류가 발생하였습니다.'}
       end
     end
   end

   def destroy
     @exhibition = Exhibition.find(params[:id])
     @exhibition.destroy

     respond_to do |format|
       format.html {redirect_to admin_events_path, :notice => '성공적으로 삭제하였습니다.'}
     end
   end

end
