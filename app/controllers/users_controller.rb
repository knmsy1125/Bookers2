class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    if  @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
