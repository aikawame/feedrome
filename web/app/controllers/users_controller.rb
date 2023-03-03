# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :set_user, only: %i[show edit update destroy]
  before_action :verify_user, only: %i[show edit edit_email edit_password update update_email update_password destroy]

  # GET /users
  # def authentications
  #   @users = User.all
  # end

  # GET /users/kgyfsaDuNeexRVnIRyPEIzdBTIi1
  def show
    @user = current_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/kgyfsaDuNeexRVnIRyPEIzdBTIi1/edit
  def edit
    @user = current_user
  end

  # GET /users/kgyfsaDuNeexRVnIRyPEIzdBTIi1/edit_email
  def edit_email
    @user = current_user
  end

  # GET /users/kgyfsaDuNeexRVnIRyPEIzdBTIi1/edit_password
  def edit_password
    @user = current_user
  end

  # POST /users
  def create
    @user = User.create_with_firebase(user_params)

    if @user.errors.size.zero?
      session[:firebase_uid] = @user.firebase_uid

      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/kgyfsaDuNeexRVnIRyPEIzdBTIi1
  def update
    @user = current_user
    if @user.update_with_firebase(user_params)
      redirect_to @user, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/kgyfsaDuNeexRVnIRyPEIzdBTIi1/update_email
  def update_email
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/kgyfsaDuNeexRVnIRyPEIzdBTIi1/update_password
  def update_password
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/kgyfsaDuNeexRVnIRyPEIzdBTIi1
  def destroy
    @user = current_user
    @user.destroy
    redirect_to users_url, notice: t('.success')
  end

  private

  def verify_user
    user = User.find_by(firebase_uid: params[:firebase_uid])
    if user.blank? || user != current_user
      head :forbidden
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {}).permit(:name, :email, :password)
  end
end
