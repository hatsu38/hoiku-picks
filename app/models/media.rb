# frozen_string_literal: true

class Media < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
