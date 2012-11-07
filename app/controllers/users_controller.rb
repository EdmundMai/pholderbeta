class UsersController < ApplicationController

	def index
	  if params[:search]
		@users = User.search(params[:search]).page(params[:page]).per_page(10)
	  else
	  	@users = User.order("email").page(params[:page]).per_page(10)
	  end
	end

	def new
	  @user = User.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
	end 

	def create
	  @user = User.new(params[:user])

	  respond_to do |format|
	  	if @user.save
	  	  UserMailer.registration_confirmation(@user).deliver
	  	  log_in(@user)
	  	  format.html { redirect_to @user, notice: 'User successfully created.' }
	  	  format.json { render json: @user, status: :created, location: @user }
	  	else
	  	  format.html { render action: 'new' }
	  	  format.json { render json: @user.errors, status: :unprocessable_entity }
	  	end
      end
	end

	def show
	  @user = User.find(params[:id])
	  @albums = Album.all
	end

	def update
	  respond_to do |format|
	    if current_user.update_attributes(params[:user])
		  format.html { redirect_to current_user, notice: 'User successfully updated.'}
		  format.json { render json: current_user, status: :created, location: current_user }
		else
		  format.html { render action: 'edit' }
		  format.json { render json: current_user.errors, status: :unprocessable_entity }
		end
	  end
	end

	def edit
	  @user = User.find(params[:id])
	end

end
