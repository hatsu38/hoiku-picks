# frozen_string_literal: true

class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.text        :comment
      t.integer     :like_count, default: 0, null: false
      t.references  :user,    index: true, foreign_key: true
      t.references  :article, index: true, foreign_key: true

      t.timestamps null: false
    end

    # 同じ記事にユーザーは複数のPickはできない
    add_index :picks, %i[user_id article_id], unique: true
  end
end
