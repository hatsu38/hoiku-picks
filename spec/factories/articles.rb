# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "テストTitle_#{n}" }
    sequence(:description) { |n| "テストDescription_#{n}" }
    sequence(:image) { |n| "テストImage_#{n}" }
    sequence(:url) { |n| "テストUrl_#{n}" }
  end
end
