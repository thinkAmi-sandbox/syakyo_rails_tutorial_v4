class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Sessionヘルパモジュールを読み込む
  include SessionsHelper

  private

  # ユーザーのログインを確認する
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
