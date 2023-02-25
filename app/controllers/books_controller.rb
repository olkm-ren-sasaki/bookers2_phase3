class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new 
    # DM機能
    @user = @book.user
    unless @user == current_user
      @room_id = current_user.get_room_id(@user)
    end
    # 閲覧機能
    @book.view_counts.create(user_id: current_user.id)
    @view_counts = @book.view_counts.count
  end

  def index
    @books = Book.includes(:favorites).sort_by{|book| -book.favorites.size}
    @book = Book.new
    
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end
