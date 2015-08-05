# -*- encoding : utf-8 -*-
class Admin::CurrentsController < ApplicationController
  layout 'admin'
  before_filter :login_required
  
  def index
    @currents = Current.order("idex ASC")
  end
  
  def create
    @exhibition = Exhibition.find(params[:exhibition_id])
    @lastCurrent = Current.last
    
    @current = Current.new
    @current.exhibition = @exhibition
    if @lastCurrent != nil
      @current.idex = @lastCurrent.idex
    else
      @current.idex = 0
    end
    
    
    if @current.save
      redirect_to request.referer, :notice => '성공적으로 저장하였습니다.'
    else
      redirect_to request.referer, :alert => '오류가 발생하였습니다.'
    end
  end
  
  def update
    @current = Current.find(params[:id])
    @current.idex = params[:idex]
    
    respond_to do |format|
      if @current.save
        format.html { redirect_to request.referer, :notice => '성공적으로 저장하였습니다.' }
        format.json { render :json => {:success => true} }
      else
        format.html { redirect_to request.referer, :alert => '오류가 발생하였습니다.' }
        format.json { render :json => {:success => true }}
      end
    end
  end
  
  def destroy
    @current = Current.find(params[:id])
    @current.destroy
    
    redirect_to request.referer, :notice => '성공적으로 삭제하였습니다.'
  end
  
  def cancel_main
    @current = Current.where(:exhibition_id => params[:exhibition_id]).first
    
    @current.destroy
    redirect_to request.referer, :notice => '성공적으로 삭제하였습니다.'
    
  end
end
