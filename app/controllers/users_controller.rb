class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end    
  end
  
  def login
    @user = User.new
  end
  
  def result
    form_user = User.new(params[:user])
    @user = User.find_by_lastname_and_password(form_user.lastname, form_user.password)
    if @user
      session[:id] = @user.id
      redirect_to cabinet_path
    else
      @user = User.new
      render 'login'
    end
    
  end
  
  def logout
    
    session[:id] = nil
    redirect_to root_path
  end
  
end