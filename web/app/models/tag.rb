# frozen_string_literal: true

# タグ
class Tag < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :subscriptions, through: :taggings

  validates :name, presence: true, uniqueness: { scope: :user_id, case_sensitive: false }

  acts_as_list scope: :user
end
