class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  # def new
  #   @book = Book.new
  #   @books = Book.all
  # end

  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book)
    else
      @books = Book.all
      render "books/index"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id]) #データ(レコード)を1件取得
    book.destroy #データ（レコード）を削除
    redirect_to books_path #List一覧画面へリダイレクト
  end

  private

    def book_params
      params.require(:book).permit(:title, :body)
    end
  
  end



