# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, comment: 'ユーザーID', foreign_key: true
      t.references :feed, null: false, comment: 'フィードID', foreign_key: true
      t.string     :title,             comment: 'タイトル'

      t.timestamps
    end
  end
end
