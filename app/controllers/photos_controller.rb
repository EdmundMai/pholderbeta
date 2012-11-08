class PhotosController < ApplicationController

	def new
	  @user = User.find(params[:user_id])
	  @album = @user.albums.find(params[:album_id])
	  @photo = @album.photos.build
	  @photos = @album.photos
	end

	def create
	  @user = User.find(params[:user_id])
	  @album = Album.find(params[:album_id])
      @photo = @album.photos.build(params[:photo])
      @photo.save
	end

	def destroy
	  @user = User.find(params[:user_id])
	  @album = @user.albums.find(params[:album_id])
	  @photo = @album.photos.find(params[:id])
	  respond_to do |format|
	    if @photo.destroy
	      format.js
		end
	  end
	end

end


	
