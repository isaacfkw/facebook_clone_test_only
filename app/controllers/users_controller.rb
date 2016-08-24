class UsersController < ApplicationController
  before_action :this_user, only: [:update]
  before_action :logged_in?, only: [:edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created. Please log in now."
      redirect_to @user
    else
      flash[:alert] = "Error creating account: "
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Account is updated successfully."
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.delete(params[:id])
    flash[:notice] = "Account is deleted"
    redirect_to statuses_path 
  end


  private
  def user_params #whitelist of parameters that can enter ur database
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def this_user
    @user = User.find(params[:id])
  end
end
