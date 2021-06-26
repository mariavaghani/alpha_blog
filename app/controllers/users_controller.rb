class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @page_name = 'Sign up for Alpha BLog'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Hi, #{@user.username}! Welcome to the Alpha Blog, you have successfully signed up"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    @page_name = 'Edit User Information'
  end

  def update

    if @user.update(user_params)
      flash[:notice] = "Hey #{@user.username}, your information was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @article_list = @user.articles
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
