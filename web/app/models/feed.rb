# frozen_string_literal: true

# フィード
class Feed < ApplicationRecord
  validates :source_url, presence: true, uniqueness: { case_sensitive: false }
  validates :source_url, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
  validates :language_code, format:/\A[a-z-]+\z/
  validates :link_url, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
end
