# frozen_string_literal: true

class PasswordsController < ApplicationController
  # GET /password/edit
  def edit
    @password = Password.new
  end

  # PATCH/PUT /password
  def update
    if @password.update_with_firebase(current_user.firebase_uid, password_params)
      redirect_to user_path, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def password_params
    params.fetch(:password, {}).permit(:current_value, :new_value, :new_value_confirmation)
  end
end
