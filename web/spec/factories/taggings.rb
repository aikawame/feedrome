# frozen_string_literal: true

FactoryBot.define do
  factory :tagging do
    tag { create(:tag) }
    subscription { create(:subscription) }
    sequence(:position) { |n| n }
  end
end
