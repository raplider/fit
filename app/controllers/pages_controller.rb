# -*- encoding : utf-8 -*-
#encoding: utf-8
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
  end

  def deanery_correspondence
    if session[:id] != nil
      @user = Admin.find(session[:id])    
    end

    @posts = Post.paginate(:page => params[:page]).find_all_by_department_and_form_of_study("Деканат","ЗВ")

    #if session[:id] != nil
     # @user = Admin.find(session[:id])    
    ##end
    #@users = Admin.find_all_by_department("Деканат")

    #@posts = Array.new 
    #for u in @users
     # @posts.push Post.paginate(:page => params[:page]).find_all_by_user_id_and_form_of_study(u.id, "ЗВ")
    #end
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

  def private_cabinet
    if session[:id] == nil
      redirect_to login_path
    else
      @admin = Admin.find(session[:id])
    end
  end 
  
end
