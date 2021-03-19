class BooksController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: 'You have created book successfully.'
    else
      @user = current_user
    	render :index
    end
  end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.new
    @book_show = Book.find(params[:id])
    @user = current_user
    @user_show = @book_show.user
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
    if  @user == @book.user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
