class AdminsController < ApplicationController
    
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect_to supervisor_admin_path
    else
      render 'new'
    end    
  end
  
  def login
    @user = User.new
    if session[:id] != nil
      @user = User.find(session[:id])
      if @user.lastname == "admin"
	redirect_to supervisor_admin_path
      else
	#@user = User.new
	render 'login'
      end
    else
      #@user = User.new
      render 'login'
    end
  end
  
  def result
    @user = User.find_by_lastname_and_password(params[:user][:lastname], params[:user][:password])
    if @user && @user.lastname == "admin"
      session[:id] = @user.id
      redirect_to supervisor_admin_path
    else
      #@user = User.new
      #render 'login'      
      redirect_to supervisor_login_path
    end
  end
  
  def logout
    session[:id] = nil
    redirect_to supervisor_login_path
  end
  
  def admin
    if session[:id] != nil
      @user = User.find(session[:id])
      if @user.lastname == "admin"
	@all_user = User.all
      else
	#@user = User.new
	#render 'login'
	redirect_to supervisor_login_path
      end
    else
      #@user = User.new
      #render 'login'
      redirect_to supervisor_login_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:user][:id])
    if @user.update_attributes(params[:user])
      redirect_to supervisor_admin_path
    else
      redirect_to supervisor_admin_edit_path + "?id=" + params[:user][:id]
    end
  end
  
  #def deanery_editor
  #  if session[:id] != nil
  #    	@user = User.find(session[:id])
  #  else
  #  	@user = nil
  #    	redirect_to :action=>"deanery", :controller=>"pages"
  #  end
  #end

  def static_pages_editor
  end
end
