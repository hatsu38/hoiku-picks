# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :pick

  validates :user_id, uniqueness: { scope: :pick_id }
end
