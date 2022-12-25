# frozen_string_literal: true

class CreateFeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :feeds do |t|
      t.string   :source_url, null: false, comment: 'ソースURL'
      t.string   :title,                   comment: 'タイトル'
      t.text     :description,             comment: '説明'
      t.string   :language_code,           comment: '言語コード'
      t.string   :link_url,                comment: 'リンク先URL'
      t.datetime :modified_at,             comment: '更改日時'
      t.datetime :crawled_at,              comment: 'クロール日時'

      t.timestamps
    end

    add_index :feeds, :source_url, unique: true
  end
end
