# frozen_string_literal: true

# アイテム
class Item < ApplicationRecord
  belongs_to :feed

  validates :link_url, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
end
