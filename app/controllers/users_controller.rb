class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @submit_today = @user.submit_today.count
    @submit_yesterday = @user.submit_yesterday.count
    @submit_this_week = @user.submit_this_week.count
    @submit_last_week = @user.submit_last_week.count
    @submit_seven_days = @user.submit_seven_days
    @books_each_days = @user.submit_seven_days
    @search_book = nil
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def chart
    return session[:submit_seven_days]
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
