# frozen_string_literal: true

FactoryBot.define do
  factory :feed do
    source_url { Faker::Internet.unique.url }
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    language_code { %w[ja en fr de zh-tw].sample }
    link_url { Faker::Internet.url }
    modified_at { rand(3.days.ago..Time.zone.now) }
    crawled_at { rand(3.days.ago..Time.zone.now) }
  end
end
