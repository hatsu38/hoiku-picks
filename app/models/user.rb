# frozen_string_literal: true

class User < ApplicationRecord
  has_many :authorizations, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :picks, through: :likes

  has_many :picks, dependent: :destroy
  has_many :articles, through: :picks

  validates :name, presence: true

  def self.create_from_auth!(auth)
    User.create!(name: auth[:info][:name], image: auth[:info][:image])
  end
end
