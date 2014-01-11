# -*- encoding : utf-8 -*-
class PostsController < ApplicationController

  before_filter :admin_logged_in?, except: [:index, :show]

  def new
    @post = Post.new
    @user = Admin.find(session[:id])
    @cabinet = params[:cabinet]
  end
  

  def create

    @user = Admin.find(session[:id])
    @post = @user.posts.build(params[:post])

    if !params[:cabinet]
      @post.department = @user.department
    end
    
  
    if @post.save
          if params[:cabinet]
            redirect_to cabinet_path
          elsif @user.department == "ПЗС"
            redirect_to chairs_pzs_path
          elsif @user.department == "ІУСТ" 
            redirect_to chairs_iust_path
          elsif @user.department == "ЗІММ" 
            redirect_to chairs_zimm_path
          elsif @user.department == "Деканат" && @post.form_of_study == "ДВ"
            redirect_to deanery_full_time_path
          elsif @user.department == "Деканат" && @post.form_of_study == "ЗВ"
            redirect_to deanery_correspondence_path
          elsif @user.department == "Студент"
          else
            redirect_to student_scientific_society_path
          end   
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_path 
    end
    
  end

  
  def edit
    @post = Post.find(params[:id])
    if session[:id] != nil
      @user = Admin.find(session[:id])
      @cabinet = params[:cabinet]
    else
      flash[:error] = @post.errors.full_messages
      redirect_to root_path
    end
  end
  
  def update
    @user = Admin.find(session[:id])
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { 
          if params[:cabinet]
            redirect_to cabinet_path
          elsif @user.department == "ПЗС"
            redirect_to chairs_pzs_path
          elsif @user.department == "ІУСТ" 
            redirect_to chairs_iust_path
          elsif @user.department == "ЗІММ" 
            redirect_to chairs_zimm_path
          elsif @user.department == "Деканат" && @post.form_of_study == "ДВ"
            redirect_to deanery_full_time_path
          elsif @user.department == "Деканат" && @post.form_of_study == "ЗВ"
            redirect_to deanery_correspondence_path
          elsif @user.department == "Студент"
          else
            redirect_to scientific_society_path
          end   
      }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end    

  end
  
  def delete
    @user = Admin.find(session[:id])
    @post = Post.find(params[:id])
    if @post.delete
      redirect_to cabinet_path
    end    
  end

  private 

    def admin_logged_in?
        session[:id] ? true : (redirect_to root_path, alert: "У вас відсутні права для перегляду цієї сторінки")
    end

end
