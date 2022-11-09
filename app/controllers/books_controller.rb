class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all.order(id: :asc)
    @book = Book.new

    # editの情報
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def create
    @books = Book.all.order(id: :asc)
    @book = Book.new(book_params)

    if @book.save!
      flash[:notice] = "Book was successfully created."
      redirect_to @book
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :introduction).merge(user_id:current_user.id)
  end
end
