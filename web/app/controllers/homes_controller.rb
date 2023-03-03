# frozen_string_literal: true

# ホームコントローラー
class HomesController < ApplicationController
  skip_before_action :verify_user

  # GET /homes
  def index

  end
end
