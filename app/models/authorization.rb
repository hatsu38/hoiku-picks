# frozen_string_literal: true

class Authorization < ApplicationRecord
  belongs_to :user

  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }
  validates :uid, raw_info: true, uniqueness: true

  def self.find_from_auth(auth)
    find_by(provider: auth['provider'], uid: auth['uid'])
  end

  def self.create_from_auth(auth, user = nil)
    user ||= User.create_from_auth!(auth)
    nickname = if auth[:provider] == 'twitter'
                 auth[:info][:nickname]
               elsif auth[:provider] == 'facebook'
                 auth[:info][:name]
               else
                 nil
               end
    Authorization.create!(
      user: user,
      uid: auth['uid'],
      provider: auth['provider'],
      email: auth[:info][:email],
      name: nickname,
      raw_info: auth[:extra][:raw_info]
    )
  end
end
