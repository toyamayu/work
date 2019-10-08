class UsersController < ApplicationController

        def show
            @user = User.find(params[:id])
            @books = @user.books
            @book = Book.new
            flash[:notice] = "Signed in successfully." unless user_signed_in?
        end

        def new
            @user = User.new
            @book = Book.new
        end

        def create
            @user = User.new(user_params)
            @user = current_user
            if @user.save
            flash[:notice] ="Welcome! You have signed up successfully."
            redirect_to user_path
            else
                @users = User.all
                @book = Book.new 
                render :index
            end

        end

        def index
            @user = current_user
            @book = Book.new
            @users = User.all
        end

        def edit
            @user = User.find(params[:id])
            if @user != current_user
                redirect_to user_path(current_user)
            end
        end


        def update
        
            @user = User.find(params[:id])
            if @user.update(user_params)
                flash[:notice] = "You have updated user successfully."
                redirect_to user_path(current_user)
            else
                flash[:danger] = "error"
            render :edit
            end

        end

        def destroy
            user = User.find(params[:id])
            user.delete
        end

        before_action :login_check, only: [:index, :edit, :show]
     
    private
    def user_params
        params.require(:user).permit(:name,:profile_image,:introduction)
    end

    def book_params
        params.require(:book).permit(:title,:body,:profile_image)
    end

    def login_check
        unless user_signed_in?
          redirect_to new_user_session_path
        end
      end




end
