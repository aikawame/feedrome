# frozen_string_literal: true

# ユーザー
class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :firebase_uid, format: /\A[a-zA-Z0-9]+\z/, presence: true, uniqueness: true
  validates :name, presence: true

  attribute :email, :string
  attribute :password, :string
  attribute :id_token, :string

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

  def self.find_by_email(email, password)
    result = Worklover::Firebase.verify_password(email, password)
    user = find_by(firebase_uid: result&.local_id)
    user.email = result&.email
    user.id_token = result&.id_token
    user
  rescue Google::Apis::ClientError
    err_obj = new
    err_obj.errors.add(:email, :invalid_email_or_password)
    err_obj
  end

  def self.create_with_firebase(name:, email:, password:)
    register_result = Worklover::Firebase.signup_new_user(name, email, password)
    user = create(firebase_uid: register_result&.local_id, name: name)
    user.email = email
    verify_result = Worklover::Firebase.verify_password(email, password)
    user.id_token = verify_result&.id_token
    user
  rescue Google::Apis::ClientError => e
    err_obj = new
    case e.message
    when 'invalid: INVALID_EMAIL'
      err_obj.errors.add(:email, :invalid_email)
    when 'invalid: EMAIL_EXISTS'
      err_obj.errors.add(:email, :email_exists)
    when 'invalid: WEAK_PASSWORD'
      err_obj.errors.add(:password, :weak_password)
    else
      err_obj.errors.add(:password, :unknown_error)
    end
    err_obj
  end

  def update_with_firebase
    result = Worklover::Firebase.set_account_info(firebase_uid, name, email, password)
    update(name: result&.display_name)
  rescue Google::Apis::ClientError => e
    err_obj = new
    case e.message
    when 'invalid: INVALID_EMAIL'
      err_obj.errors.add(:email, :invalid_email)
    when 'invalid: EMAIL_EXISTS'
      err_obj.errors.add(:email, :email_exists)
    when 'invalid: WEAK_PASSWORD'
      err_obj.errors.add(:password, :weak_password)
    else
      err_obj.errors.add(:password, :unknown_error)
    end
    err_obj
  end

  def destroy_with_firebase
    Worklover::Firebase.delete_account(firebase_uid)
    destroy
  rescue Google::Apis::ClientError
    self
  end
end
