class AdminsController < ApplicationController
  def deanery_editor
  	#if session[:id] != nil
    #  	@user = User.find(session[:id])
    #else
    #	@user = nil
    #  	redirect_to :action=>"deanery", :controller=>"pages"
    #end
  end

  def static_pages_editor
  end
end
