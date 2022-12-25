# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    firebase_uid { Faker::Alphanumeric.unique.alpha(number: 28) }
    name { Faker::Name.name }
  end
end
