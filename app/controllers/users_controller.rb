class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :correct_user, only: [:edit, :update]
  def new

      @book = Book.new
  end

 def create

   @book = Book.new(book_params)
   @book.user_id = current_user.id
   @user = current_user
   if@book.save


   redirect_to book_path(@book.id),notice: 'Book was successfully created.'


   else
     flash.now[:error] = "There was an error creating the user."
    render :new
     @books = Book.all
     @user = current_user
      render :index
   end
 end

  def index
    @users = User.all
    @book =Book.new
    @user =current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  
     @user = User.find(params[:id])
     
  end

  def update
    
     @user = User.find(params[:id])

    if@user.update(user_params)
    flash[:notice]= "user was successfully updated"
    redirect_to user_path(@user.id)

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
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_url(current_user)) unless @user == current_user
  end


end

