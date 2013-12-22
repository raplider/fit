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
      @user = User.find(session[:id])
      @all_user = User.all
    end

  end 
  
end
