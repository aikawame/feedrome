# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :subscriptions, through: :taggings

  acts_as_list scope: :user
end
