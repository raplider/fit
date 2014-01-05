# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController

	# Для сторінки з формую логіна
	def new 
		@admin = Admin.new 
	end

	# Якщо дані вірні - залогінити
	def create
   		@admin = Admin.login(params[:admin])
    	if @admin
     		session[:id] = @admin.id
     		flash[:success] = "Вхід успішно здійснено"
      		redirect_to cabinet_path
    	else
    		flash[:error] = "Обліковий запис не 
    						 зареєстровано або введено 
    						 невірний пароль"
      		redirect_to new_session_path
    	end
	end

	# Юзер виходить, сесію видаляєм
	def destroy
		session[:id] = nil
    	redirect_to root_path
	end

end
