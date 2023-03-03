# frozen_string_literal: true

class AuthenticationsController < ApplicationController
  skip_before_action :verify_user

  # GET /login
  def login
    @user = User.new
  end

  # POST /login
  def verify
    raise
    result = Worklover::Firebase.get_account_info(params[:id_token])
    user = User.find_or_create_by(firebase_uid: result.local_id, name: result.display_name)
    session[:firebase_uid] = user.firebase_uid

    redirect_to user_path(user.firebase_uid)
  rescue StandardError
    redirect_to login_path, alert: t('.failure')
  end

  # GET /logout
  def logout
    session.delete(:firebase_uid)

    redirect_to login_path
  end
end
