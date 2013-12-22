class AlbumController < ApplicationController

  def new
    @album = Album.new
  end
  
  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to "/gallery"
    else
      redirect_to "/gallery/error" 
    end
  end
  
  def view
    @user = User.find(1)
    @albums = Album.paginate(:page => params[:page])
  end

  def delete
    @album=Album.find(params[:id])
    if @album.delete
      redirect_to "/gallery"
    else
      redirect_to '/gallery/error'
    end
  end
end
