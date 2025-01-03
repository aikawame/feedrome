# frozen_string_literal: true

class CreateFeeds < ActiveRecord::Migration[8.0]
  def change
    create_table :feeds do |t|
      t.string   :source_url,   null: false
      t.string   :title,        null: false
      t.text     :description
      t.string   :langage_code
      t.string   :link_url,     null: false
      t.datetime :modified_at,  null: false
      t.datetime :crawled_at,   null: false

      t.timestamps
    end

    add_index :feeds, :source_url, unique: true
    add_index :feeds, :crawled_at
  end
end
