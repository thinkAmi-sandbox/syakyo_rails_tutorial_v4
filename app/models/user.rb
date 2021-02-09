class User < ApplicationRecord
  # 保存前のコールバック
  before_save { self.email = email.downcase }

  # オプションハッシュ `presence: true` を渡すバリデーションメソッド
  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }  # 大小を区別しない一意

  # ユーザーがセキュアなパスワードを持っている
  has_secure_password  # 新しくレコードが追加されるときだけ依存性のバリデーションが動作

  validates :password, presence: true, length: { minimum: 6 }  # 更新時もバリデーションが適用されるようにする
end
