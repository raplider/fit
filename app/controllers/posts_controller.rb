class PostsController < ApplicationController
  def new
    @post = Post.new
    if session[:id] != nil
      @user = User.find(session[:id])
    else
      redirect_to root_path
    end
  end
  
  def create
    @user = User.find(session[:id])
    @post = @user.posts.build(params[:post])
    if @post.save
      redirect_to cabinet_path
    else
      render 'new'
    end    
  end
  
  def edit
    @post = Post.find(params[:id])
    if session[:id] != nil
      @user = User.find(session[:id])
    else
      redirect_to root_path
    end
  end
  
  def update
    @user = User.find(session[:id])
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to cabinet_path
    else
      render 'edit'
    end    
  end
  
  def delete
    @user = User.find(session[:id])
    @post = Post.find(params[:id])
    if @post.delete
      redirect_to cabinet_path
    end    
  end
end
