# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "MyNameIs_#{n}" }
    sequence(:image) { |n| "MyIcon_#{n}" }
    sequence(:description) { |n| "Description_#{n}" }

    after(:create) do |user|
      create_list(:authorization, 2, user: user)
    end
  end
end
