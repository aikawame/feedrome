# frozen_string_literal: true

class CreateTaggings < ActiveRecord::Migration[8.0]
  def change
    create_table :taggings do |t|
      t.references :tag,          null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.integer    :position,     null: false, default: 0

      t.timestamps
    end
  end
end
