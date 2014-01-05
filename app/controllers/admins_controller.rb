# -*- encoding : utf-8 -*-
class AdminsController < ApplicationController
  
  # Перед кожним методом запускаєм метод, який перевіряє, чи юзер залогінений
  before_filter :admin_logged_in?
  # Перевіряє, чи адмін є суперадміном
  before_filter :super_admin?

  # Сторінка із списком всіх адмінів
  def index
    @admin      = Admin.find(session[:id])
    @all_admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end
  
  def new
    @admin = Admin.new
  end
  
  def create
    @admin = Admin.new(params[:admin])

    if @admin.save
      session[:id] = @admin.id
      flash[:success] = "Обліковий запис успішно створено"
      redirect_to admins_path
    else
      flash[:error] = "Виникли помилки при створенні 
                         облікового запису"
      render :new
    end    
  end
  
  def edit
    @admin = Admin.find(params[:id])
  end
  
  def update
    @admin = Admin.find(params[:id])

    if @admin.update_attributes(params[:admin])
      flash[:success] = "Обліковий запис успішно оновлено"
      redirect_to admin_path(session[:id])
    else
  
      flash[:error] = @admin.errors.full_messages
      redirect_to edit_admin_path(@admin)
    end
  end

  private

    # Якщо адмін не залогінений - редірект в рут_пас
    def admin_logged_in?
      session[:id] ? true : (redirect_to root_path, alert: "У вас відсутні права для перегляду цієї сторінки")
    end
    
    # Якщо ід сторінки не == ід залогіненого адміна (напр. /admin/edit/2 і session[:id] == 1)
    # або адмін не є СУПЕРАДМІНОМ послати в рут_пас
    def super_admin?
      admin = Admin.find(session[:id])

      unless params[:id].to_s == session[:id].to_s || admin.lastname == "admin"
        redirect_to root_path, alert: "У вас відсутні права для перегляду цієї сторінки" 
      end
    end
end
