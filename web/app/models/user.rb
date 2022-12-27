# frozen_string_literal: true

# ユーザー
class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :firebase_uid, format: /\A[a-zA-Z0-9]+\z/, presence: true, uniqueness: true
  validates :name, presence: true
end
