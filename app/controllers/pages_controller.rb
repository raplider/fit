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
   # if session[:id] == nil
   #   redirect_to "/chairs/pzs"
   # else
    
    @user = User.find(session[:id])
    @posts = Post.all
    #end
  end

  def private_cabinet
    if session[:id] == nil
      redirect_to login_path
    else
      @user = User.find(session[:id])
    end

  end
  
end
