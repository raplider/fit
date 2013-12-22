class PhotosController < ApplicationController
  
  def view
    @user = User.find(1)
    @photos = Photo.where(:album_id => params[:album_id]).paginate(:page => params[:page])
  end
  
  def new
    @album = Album.find(params[:album_id])
    @photo = Photo.new
  end
  
  def create
    @user = User.find(1)
    @photo = @user.photos.build(params[:photo])
    if @photo.save
      redirect_to "/gallery/album/#{@photo.album_id}"
    else
      redirect_to '/gallery/error'
    end
  end
  
  def voteup
    photo=Photo.find(params[:id])
    photo.vote = photo.vote + 1
    photo.save!
    render :text => "Rating: #{ photo.vote }"
  end
  
  def edit
    @photo=Photo.find(params[:id])
  end
  
  def update
    @photo=Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      redirect_to "/gallery/album/#{@photo.album_id}"
    else
      redirect_to '/gallery/error'
    end
  end

  def delete
    @photo=Photo.find(params[:id])
    album_id = @photo.album_id
    if @photo.delete
      redirect_to "/gallery/album/#{album_id}"
    else
      redirect_to '/gallery/error'
    end
  end
end
