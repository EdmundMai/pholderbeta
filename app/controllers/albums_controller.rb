class AlbumsController < ApplicationController

	def index
	  @user = User.find(params[:user_id])
	  @albums = @user.albums.all

	  respond_to do |format|
	  	format.html
	  	format.json { render json: @albums }
	  end
	end

	def show
	  @user = User.find(params[:user_id])
	  @album = @user.albums.find(params[:id])
	  @photos = @album.photos
	end

	def update
	  @user = User.find(params[:user_id])
	  @album = @user.albums.find(params[:id])
	  respond_to do |format|
		if @album.update_attributes(params[:album])
	      format.html { redirect_to user_album_path(@user, @album), notice: 'Album successfully updated' }
		else
		  format.html { render 'edit' }
		end
	  end
	end

	def edit
	  @user = User.find(params[:user_id])
	  @album = @user.albums.find(params[:id])
	end

	def create
	  @user = User.find(params[:user_id])
	  @album = @user.albums.build(params[:album])
	  # @friends = @user.friends.find(params[:album][:user_ids])
	  if @user.save
		redirect_to user_album_path(@user, @album), notice: 'Album was successfully created.'
	  else
		render action: "new"
	  end
	end

	def new
	  @user = User.find(params[:user_id])
	  @album = Album.new
	end

	def destroy
	  @user = User.find(params[:user_id])
	  @album = @user.albums.find(params[:id])
	  @album.destroy
	  flash[:notice] = "Album successfully deleted."
	  redirect_to user_path(@user)
	end


end
