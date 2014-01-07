# -*- encoding : utf-8 -*-
#encoding: utf-8
class PagesController < ApplicationController
  def index
  end

  def chairs
  end
  
  def deanery
  end

  def applicant
  end

  def contact
  end
  
  def pzs
    if session[:id] != nil
      @user = Admin.find(session[:id])    
    end

    @posts = Post.find_all_by_department("ПЗС")
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
  end

  def private_cabinet
    if session[:id] == nil
      redirect_to login_path
    else
      @admin = Admin.find(session[:id])
    end
  end 
  
end
