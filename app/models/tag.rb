# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :user

  acts_as_list scope: :user
end
