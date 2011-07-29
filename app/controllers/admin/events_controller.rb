# -*- encoding : utf-8 -*-
class Admin::EventsController < ApplicationController
    before_filter :login_required
    layout 'admin'

    def index
      @events = Event.order('start_date DESC')
      

    end

    def set_current
      @events = Event.all
      @event = Event.find(params[:id])
      @events.each do |event|
        if event.id != @event.id
          event.current = false
          event.save
        end
      end

      if !@event.upcoming
        @event.current = !@event.current
        respond_to do |format|
          if @event.save
            format.html {redirect_to admin_events_path, :notice => '성공적으로 변경하였습니다.'}
          else
            format.html {redirect_to admin_events_path, :notice => '오류가 발생하였습니다.'}
          end
        end
      end
    end

    def set_upcoming
      @events = Event.all
      @event = Event.find(params[:id])
      @events.each do |event|
        if event.id != @event.id
          event.upcoming = false
          event.save
        end
      end



      if !@event.current 
        @event.upcoming =!@event.upcoming
        respond_to do |format|
          if @event.save
            format.html {redirect_to admin_events_path, :notice => '성공적으로 변경하였습니다.'}
          else
            format.html {redirect_to admin_events_path, :notice => '오류가 발생하였습니다.'}
          end
        end
      end

    end

    def create
      @event = Event.new(params[:event])
      respond_to do |format|
        if @event.save
          format.html {redirect_to admin_events_path, :notice => '교육프로그램이 성공적으로 생성되었습니다.'}
        else
          format.html {redirect_to admin_events_path, :alert => '교육프로그램 생성이 실패하였습니다.'}
        end
      end
    end

    def show
    end

    def edit
      @event = Event.find(params[:id])
    end

    def update
      @event = Event.find(params[:id])        
      @event.bigphoto.reprocess!
      respond_to do |format|
        if @event.update_attributes(params[:event])
          format.html {redirect_to admin_events_path, :notice => '교육프로그램이 성공적으로 수정되었습니다.' }
        else
          format.html {redirect_to admin_events_path, :alert => '교육프로그램 수정 중 오류가 발생하였습니다.'}
        end
      end
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy

      respond_to do |format|
        format.html {redirect_to admin_events_path, :notice => '성공적으로 삭제하였습니다.'}
      end
    end

end
