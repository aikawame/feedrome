# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :feed
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end
