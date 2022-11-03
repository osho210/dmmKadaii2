class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all.order(id: :asc)
    @book = Book.new
  end

  def show
    @books = Book.all.order(id: :asc)
    @book = Book.find(params[:id])
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
