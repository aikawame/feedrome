# frozen_string_literal: true

FactoryBot.define do
  factory :tagging do
    tag { nil }
    subscription { nil }
    position { 1 }
  end
end
