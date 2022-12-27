# frozen_string_literal: true

# 購読
class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :feed
end
