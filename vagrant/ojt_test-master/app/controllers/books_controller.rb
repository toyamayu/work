class BooksController < ApplicationController
  before_action :authenticate_user!, :new_book
  before_action :correct_user, only: [:edit]

  def create
    @new_book = Book.new(book_params)
    @new_book.user = current_user
    if @new_book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@new_book.id)
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def index
    @user = User.find(current_user.id)
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def new_book
    @new_book = Book.new
  end

  def correct_user
    book = Book.find(params[:id])
    user = book.user
    if current_user.id != user.id
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
