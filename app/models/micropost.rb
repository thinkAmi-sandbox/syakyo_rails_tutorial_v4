class Micropost < ApplicationRecord
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  # マイクロポストのuser_idを検証
  validates :user_id, presence: true

  validates :content, presence: true, length: { maximum: 140 }
end
