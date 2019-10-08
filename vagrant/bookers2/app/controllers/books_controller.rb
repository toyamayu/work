class BooksController < ApplicationController

    def top
    end

    def about
    end

    def show
        
        @book = Book.find(params[:id])
        @user = @book.user
    end


    def new
        @book = Book.new
        @user = User.new
    end

    def create
        @book = Book.new(book_params)
        @book.user = current_user
        if  @book.save
            flash[:notice] = "You have creatad book successfully." 

            redirect_to book_path(@book)
        else
          @user = current_user
          @books = Book.all
          render :index
        end
    end

    def index
        @user = current_user
        @book = Book.new
        @books= Book.all
     end

    def edit
        
         @book = Book.find(params[:id])
        
        if @book.user != current_user
            redirect_to books_path
        end

    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] ="Welcome! You have signed up successfully."
           redirect_to book_path(@book)
        else
            flash[:danger] = "error"
            render :edit
        end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    before_action :login_check, only: [:index, :edit, :show]

    

    private

    def book_params
        params.require(:book).permit(:title,:body)
    end

    def login_check
        unless user_signed_in?
          redirect_to new_user_session_path
        end
      end

    

end
