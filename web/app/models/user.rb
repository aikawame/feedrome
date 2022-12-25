# frozen_string_literal: true

# ユーザー
class User < ApplicationRecord
  validates :firebase_uid, format: /\A[a-zA-Z0-9]+\z/, presence: true, uniqueness: true
  validates :name, presence: true
end
