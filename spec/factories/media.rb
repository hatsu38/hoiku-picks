# frozen_string_literal: true

FactoryBot.define do
  factory :media do
    sequence(:name) { |n| "メディア名_#{n}" }
  end
end
