# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :feed,         null: false, comment: 'フィードID', foreign_key: true
      t.string     :title,        null: false, comment: 'タイトル'
      t.text       :description,               comment: '説明'
      t.string     :link_url,     null: false, comment: 'リンク先URL'
      t.datetime   :published_at, null: false, comment: '公開日時'

      t.timestamps
    end
  end
end
