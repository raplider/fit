# -*- encoding : utf-8 -*-
#encoding: utf-8
class PagesController < ApplicationController
  def index
  end

  def chairs
  end
  
  def deanery
  end

  def deanery_full_time
    @form_of_study = "full_time"

    if session[:id] != nil
      @user = Admin.find(session[:id])    
    end
    @users = Admin.find_all_by_department("Деканат")

    @posts = Array.new 
    for u in @users
      @posts.push Post.paginate(:page => params[:page]).find_all_by_user_id_and_form_of_study(u.id, "ДВ")
    end
  end

  def deanery_correspondence
    @form_of_study = "correspondence"

    if session[:id] != nil
      @user = Admin.find(session[:id])    
    end
    @users = Admin.find_all_by_department("Деканат")

    @posts = Array.new 
    for u in @users
      @posts.push Post.paginate(:page => params[:page]).find_all_by_user_id_and_form_of_study(u.id, "ЗВ")
    end
  end

  def applicant
  end

  def contact
  end
  
  def pzs
    if session[:id] != nil
      @user = Admin.find(session[:id])    
    end
    @users = Admin.find_all_by_department("ПЗС")

    @posts = Array.new 
    for u in @users
      @posts.push Post.find_all_by_user_id(u.id)
    end
 # end
  end

  def private_cabinet
    if session[:id] == nil
      redirect_to login_path
    else
      @admin = Admin.find(session[:id])
    end
  end 
  
end
