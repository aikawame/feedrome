# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    user { create(:user) }
    feed { create(:feed) }
    title { Faker::Lorem.word }
  end
end
