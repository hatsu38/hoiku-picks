# frozen_string_literal: true

FactoryBot.define do
  factory :pick do
    article { create(:article) }
    user { create(:user) }
    like_count { 0 }
  end
end
