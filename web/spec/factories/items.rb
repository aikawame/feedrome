# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    feed { create(:feed) }
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    link_url { Faker::Internet.url }
    published_at { rand(3.days.ago..Time.zone.now) }
  end
end
