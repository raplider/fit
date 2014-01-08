# -*- encoding : utf-8 -*-
class PagesController < ApplicationController
  
  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 3).order('id desc')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
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

    @posts = Post.paginate(:page => params[:page]).find_all_by_department("Студенти")

    def iust
     if session[:id] != nil
      @user = Admin.find(session[:id])    
    end
    @posts = Post.paginate(:page => params[:page]).find_all_by_department("ІУСТ")
  end

    def zimm
     if session[:id] != nil
      @user = Admin.find(session[:id])    
    end
    @posts = Post.paginate(:page => params[:page]).find_all_by_department("ЗІМM")
  end

  def private_cabinet
    if session[:id] == nil
      redirect_to login_path
    else
      @user = Admin.find(session[:id])  
    end
    @posts = Post.paginate(:page => params[:page]).find_all_by_admin_id_and_department(@user.id, nil)
  end
  
end
