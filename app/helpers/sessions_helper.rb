module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    # ブラウザを閉じた瞬間に削除されるcookieを使用
    session[:user_id] = user.id
  end
end
