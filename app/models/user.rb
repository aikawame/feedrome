# frozen_string_literal: true

class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :tags, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable, :omniauthable
end
