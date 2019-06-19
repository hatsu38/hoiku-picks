# frozen_string_literal: true

class Pick < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  validates :user_id, uniqueness: { scope: :article_id }
  validates :like_count, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :except_feature_pick, ->(pick) { where.not(id: pick) }

  def already_like?(current_user = nil)
    likes.exists?(user_id: current_user)
  end
end
