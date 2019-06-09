# frozen_string_literal: true

FactoryBot.define do
  factory :pick do
    article
    user
    like_count { 0 }
  end
end
