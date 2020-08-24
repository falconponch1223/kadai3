class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
  	@book = Book.find(params[:id])
    @user = current_user
  end
  
  def create
  	@book = Book.new(book_params)
  	@books = Book.all
    @user = current_user
    @book.user_id = current_user.id
  	if @book.save
  	  redirect_to books_path
  	  flash[:notice] = "You have creatad book successfully."
  	else
      render "index"
    end
  end

  def edit
  	@book = Book.find(params[:id])
    if @book.user == current_user
       render "edit"
    else
      redirect_to books_path
    end
  end
  def update
  	@book = Book.find(params[:id])
  	@books = Book.all
  	if @book.update(book_params)
  	redirect_to book_path(@book)
  	flash[:notice] = "You have updated book successfully."
  	else
      render "edit"
    end
  end
  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end
end
