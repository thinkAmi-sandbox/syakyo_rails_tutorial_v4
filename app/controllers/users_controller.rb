class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to the Sample App!"

      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])

    # byebug gem によるdebuggerメソッド
    # ここに来るとブレークポイントで止まるので、確認したいときはアンコメントする
    # debugger
  end

  private

    def user_params
      # ストロングパラメータ
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
