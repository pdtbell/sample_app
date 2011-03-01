class UsersController < ApplicationController

  def new
    @user = User.new
    @title = "Sign up"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # store the welcome message in the flash storage
      # flash storage is a temporary storage location that will
      # only preserve between a single state change
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      @user[:password] = ""
      @user[:password_confirmation] = ""
      render 'new'
    end
  end
end
