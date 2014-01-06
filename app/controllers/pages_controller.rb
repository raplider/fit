# -*- encoding : utf-8 -*-
#encoding: utf-8
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
  
  def deanery
  end

  def applicant
  end

  def contact
  end
  
  def pzs
    if session[:id] != nil
      @user = User.find(session[:id])    
    end
    @users = User.find_all_by_department("ПЗС")

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
