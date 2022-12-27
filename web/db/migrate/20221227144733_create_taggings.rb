# frozen_string_literal: true

class CreateTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :taggings do |t|
      t.references :tag,          null: false,             comment: 'タグID', foreign_key: true
      t.references :subscription, null: false,             comment: '購読ID', foreign_key: true
      t.integer    :position,     null: false, default: 0, comment: '位置'

      t.timestamps
    end
  end
end
