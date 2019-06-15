# frozen_string_literal: true

class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
  end
end
