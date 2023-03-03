# frozen_string_literal: true

# 基底コントローラー
class ApplicationController < ActionController::Base
  before_action :verify_user

  helper_method :current_user

  def current_user
    User.find_by(firebase_uid: session[:firebase_uid])
  end

  private

  def verify_user
    redirect_to login_path if current_user.blank?
  end
end
