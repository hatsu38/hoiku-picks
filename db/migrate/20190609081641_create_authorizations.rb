# frozen_string_literal: true

class CreateAuthorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :authorizations do |t|
      t.string     :provider, null: false
      t.string     :uid, null: false
      t.string     :email
      t.string     :name
      t.text       :raw_info, null: false, unique: true
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
