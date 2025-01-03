# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    user { nil }
    feed { nil }
  end
end
