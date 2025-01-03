# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[8.0]
  def change
    create_table :tags do |t|
      t.references :user,     null: false, foreign_key: true
      t.string     :name,     null: false
      t.integer    :position, null: false, default: 0

      t.timestamps
    end
  end
end
