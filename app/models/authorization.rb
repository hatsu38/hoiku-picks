# frozen_string_literal: true

class Authorization < ApplicationRecord
  belongs_to :user

  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }

  def self.find_from_auth(auth)
    find_by(provider: auth['provider'], uid: auth['uid'])
  end

  def self.create_from_auth(auth, user = nil)
    user ||= User.create_from_auth!(auth)
    Authorization.create!(user: user, uid: auth['uid'], provider: auth['provider'])
  end
end
