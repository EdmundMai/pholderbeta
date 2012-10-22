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

	def show
	  @album = Album.find(params[:album_id])
	  @photos = @album.photos
	end

	def destroy
	  @user = User.find(params[:user_id])
	  @album = @user.albums.find(params[:album_id])
	  @photo = @album.photos.find(params[:id])
	  # @photo.destroy
	  flash[:success] = "Photo successfully deleted."
	  respond_to do |format|
	    if @photo.destroy
	      format.js
	      # format.json { render json: @photo, status: :created, location: @photo}
		  # redirect_to user_album_path(@user, @album)
		end
	  end
	end

end


	
