class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all.order(id: :asc)
    @books = Book.all.order(id: :asc)
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all.order(id: :asc)
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    # 正常に処理されるとフラッシュメッセージ
        @user = User.new(user_params)
	      @user.save!
	      redirect_to user_path
  end




  private
  def user_params
    params.require(:user).permit(:name ,:profile_image,:introduction)
  end

end
