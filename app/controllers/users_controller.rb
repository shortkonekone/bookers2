class UsersController < ApplicationController
  def index
   @book = Book.new
   @user = current_user
   @users = User.all
  end

  def destroy
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def new
    @books = Book.all
  end

  def update
    @user = current_user
    @user.update(user_params)
     if @user.save
      flash[:notice]="You have updated user successfully."

      redirect_to user_path(@user.id)
     else
      @book = Book.new
      @books = Book.all
      @user = current_user
      render :edit

     end

  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(current_user)
    end
  end

  def create
    book = Book.new
    book.save
    redirect_to books_path

    @book.user_id = current_user.id
    if @book.save
      redirect_to user_path
    else
      render :new
    end
  end



  private


  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(users_path) unless @user == current_user
  end


end
