# frozen_string_literal: true

class CreateLike < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references  :user, index: true, foreign_key: true
      t.references  :pick, index: true, foreign_key: true

      t.timestamps null: false
    end

    # 同じ記事にユーザーは複数のLikeはできない
    add_index :likes, %i[user_id pick_id], unique: true
  end
end
