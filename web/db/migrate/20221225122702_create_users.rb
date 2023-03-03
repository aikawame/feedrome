# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string  :firebase_uid,   null: false, collation: 'utf8mb4_bin', comment: 'Firebase UID'
      t.string  :name,           null: false,                           comment: '名前'
      t.boolean :email_verified, null: false, default: false,           comment: 'メール検証済みか'

      t.timestamps
    end

    add_index :users, :firebase_uid, unique: true
  end
end
