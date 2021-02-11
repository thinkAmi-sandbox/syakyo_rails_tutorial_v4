class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user

      # チェックボックスの送信結果を処理する
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)

      redirect_to user
    else
      # flashメッセージによる、エラーメッセージの表示
      flash.now[:danger] = 'Invalid email/password combination'

      render 'new'
    end
  end

  def destroy
    # ログインしている場合のみ、セッションを破棄(ログアウト)
    log_out if logged_in?
    redirect_to root_url
  end
end
