# -*- encoding : utf-8 -*-
class DeaneryFilesController < ApplicationController
  def new
    @deanery_file = DeaneryFile.new
    if session[:id] != nil
      @user = Admin.find(session[:id])
    else
      redirect_to root_path
    end
  end
  
  def create
    @user = Admin.find(session[:id])
    @deanery_file = @user.deanery_files.build(params[:deanery_file])
  
    respond_to do |format|
      if @deanery_file.save
        format.html { redirect_to cabinet_path }
      else
        format.html { render action: 'new' }
        format.json { render json: @deanery_file.errors, status: :unprocessable_entity }
      end
    end    

  end
  
def edit
    @deanery_file= DeaneryFile.find(params[:id])
    if session[:id] != nil
      @user = Admin.find(session[:id])
    else
      redirect_to root_path
    end
  end
  
  def update
    @user = Admin.find(session[:id])
    @deanery_file = DeaneryFile.find(params[:id])

    respond_to do |format|
      if @deanery_file.update_attributes(params[:deanery_file])
        format.html { redirect_to cabinet_path }
      else
        format.html { render action: 'edit' }
        format.json { render json: @deanery_file.errors, status: :unprocessable_entity }
      end
    end     
  end
  
  def delete
    @user = Admin.find(session[:id])
    @deanery_file = DeaneryFile.find(params[:id])
    if @deanery_file.delete
      redirect_to cabinet_path
    end    
  end
end
