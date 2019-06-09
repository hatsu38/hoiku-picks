# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :image
      t.string :url, null: false
      t.datetime 'created_at'
      t.datetime 'updated_at'
    end
  end
end
