# frozen_string_literal: true

FactoryBot.define do
  factory :authorization do
    sequence(:provider) { |n| "MyNameIs_#{n}" }
    sequence(:uid) { |n| n }
    sequence(:email) { |n| "#{n}@gmail.com" }
    sequence(:name) { |n| "my_name_is#{n}" }
    sequence(:raw_info) { |n| "OmniAuth_is#{n}" }
    user { create(:user) }
  end
end
