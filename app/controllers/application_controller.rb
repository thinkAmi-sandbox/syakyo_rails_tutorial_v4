class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Sessionヘルパモジュールを読み込む
  include SessionsHelper
end
