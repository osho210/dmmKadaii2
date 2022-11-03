class UsersController < ApplicationController
  def show
    @books = Book.all.order(id: :asc)
  end

  def edit
  end
end
