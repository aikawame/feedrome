# frozen_string_literal: true

# ユーザー
class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :firebase_uid, format: /\A[a-zA-Z0-9]+\z/, presence: true, uniqueness: true
  validates :name, presence: true

  def self.find_by_id_token(id_token)
    result = Worklover::Firebase.get_account_info(id_token)
    user = find_by(firebase_uid: result&.local_id)
    user.email = result&.email
    user.id_token = result&.id_token
    user
  rescue Google::Apis::ClientError
    err_obj = new
    err_obj.errors.add(:id_token, :invalid_id_token)
    err_obj
  end

  def destroy_with_firebase
    Worklover::Firebase.delete_account(firebase_uid)
    destroy
  rescue Google::Apis::ClientError
    self
  end

  def to_param
    firebase_uid
  end
end
