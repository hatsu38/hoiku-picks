# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    pick { create(:pick) }
    user { create(:user) }
  end
end
