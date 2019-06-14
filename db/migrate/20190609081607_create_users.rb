# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string     :name, null: false
      t.string     :image
      t.text       :description

      t.timestamps null: false
    end
  end
end
