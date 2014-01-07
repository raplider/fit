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

    @posts = Post.paginate(:page => params[:page]).find_all_by_department("ПЗС")
  end

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
      @admin = Admin.find(session[:id])  
    end
    @posts = Post.paginate(:page => params[:page]).find_all_by_admin_id_and_department(@admin.id, nil)
  end
  
end
