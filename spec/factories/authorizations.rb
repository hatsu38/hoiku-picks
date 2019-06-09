# frozen_string_literal: true

FactoryBot.define do
  factory :authorization do
    sequence(:provider) { |n| "MyNameIs_#{n}" }
    sequence(:uid) { 1_111_111_111 }
    user
  end
end
