# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false, unique: true
      t.text :description, null: false
      t.string :image
      t.string :url, null: false
      t.references :media, foreign_key: true

      t.timestamps null: false
    end
  end
end
