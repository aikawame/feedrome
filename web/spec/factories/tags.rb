# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    user { create(:user) }
    name { Faker::Lorem.unique.word }
    sequence(:position) { |n| n }
  end
end
