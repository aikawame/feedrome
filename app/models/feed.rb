# frozen_string_literal: true

class Feed < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
end
