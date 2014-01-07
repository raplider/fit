# -*- encoding : utf-8 -*-
class PagesController < ApplicationController
  def index
  end

  def chairs
  end
  

  def deanery_full_time
    if session[:id] != nil
      @user = Admin.find(session[:id])    
    end

    @posts = Post.paginate(:page => params[:page]).find_all_by_department_and_form_of_study("Деканат", "ДВ")
    @deanery_file = DeaneryFile.find_all_by_form_of_study("ДВ")
  end

  def deanery_correspondence
    if session[:id] != nil
      @user = Admin.find(session[:id])    
    end

    @posts = Post.paginate(:page => params[:page]).find_all_by_department_and_form_of_study("Деканат","ЗВ")
    @deanery_file = DeaneryFile.find_all_by_form_of_study("ЗВ")
  end

  def applicant
  end

  def contact
  end
  
  def pzs
    if session[:id] != nil
      @user = Admin.find(session[:id])    
    end

    @posts = Post.paginate(:page => params[:page]).find_all_by_department("ПЗС")
  end

  def students_sg    #student
    if session[:id] != nil
      @user = Admin.find(session[:id])
    end
  end

  def scientific_society       #student
    if session[:id] != nil
      @user = Admin.find(session[:id])
    end

    @posts = Post.find_all_by_department("Студенти")
  end

  def private_cabinet
    if session[:id] == nil
      redirect_to login_path
    else
      @admin = Admin.find(session[:id])
    end
  end 
  
end
