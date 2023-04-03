class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :correct_user, only: [:edit, :update]
 

 

   

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

  
private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
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

