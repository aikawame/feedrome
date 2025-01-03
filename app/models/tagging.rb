# frozen_string_literal: true

class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :subscription

  acts_as_list scope: :tag
end
