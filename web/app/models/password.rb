# frozen_string_literal: true

# パスワード
class Password
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :firebase_uid, :string
  attribute :current_value, :string
  attribute :new_value, :string
  attribute :new_value_confirmation, :string

  validates :current_value, presence: true
  validates :new_value, presence: true
  validates :new_value, confirmation: true

  def update_with_firebase(firebase_uid, params)
    Worklover::Firebase.verify_password

    Worklover::Firebase.set_account_password(firebase_uid, params[:new_value])
  rescue Google::Apis::ClientError => e
    err_obj = new
    case e.message
    when 'invalid: WEAK_PASSWORD'
      err_obj.errors.add(:new_value, :weak_password)
    else
      err_obj.errors.add(:new_value, :unknown_error)
    end
    # err_obj
  rescue StandardError
    new.errors.add(:new_value, :unknown_error)
  end

  def update_email_with_firebase
    result = Worklover::Firebase.set_account_email()
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
