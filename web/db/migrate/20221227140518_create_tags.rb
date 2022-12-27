# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.references :user,     null: false,             comment: 'ユーザーID', foreign_key: true
      t.string     :name,     null: false,             comment: '名称'
      t.integer    :position, null: false, default: 0, comment: '位置'

      t.timestamps
    end
  end
end
