# frozen_string_literal: true

class CreateEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :entries do |t|
      t.references :feed,         null: false, foreign_key: true
      t.string     :title,        null: false
      t.text       :description
      t.string     :link_url,     null: false
      t.datetime   :published_at, null: false

      t.timestamps
    end

    add_index :entries, :link_url, unique: true
    add_index :entries, :published_at
  end
end
