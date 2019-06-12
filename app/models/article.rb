# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :picks, dependent: :destroy
  has_many :users, through: :picks

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :url, presence: true

  scope :picker, -> { where(deleted: false) }

  def mypick(user_id)
    Pick.find_by(article_id: self, user_id: user_id)
  end

  def top_like_picks(num = nil)
    Pick.where(article_id: self).order(like_count: 'desc').limit(num)
  end

  def top_like_picks_except_my_pick(num = 30, user_id = nil)
    Pick.where.not(user_id: user_id).where(article_id: self).order(like_count: 'desc').limit(num)
  end
end
