class UsersController < ApplicationController


  before_filter :set_user, :only => [:show, :edit, :update, :destroy]


  def show

  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(username: params[:user][:username], password: params[:user][:password])
     # @user = User.new(params[:user])
    if @user.save

      flash[:success] = "New user created"
      redirect_to questions_url

    else
      render 'new'
    end

  end

  private
  def set_user
    # @user = User.find(session[:id])
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,  :password,)
  end

end
