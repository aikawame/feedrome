# frozen_string_literal: true

FactoryBot.define do
  factory :entry do
    feed { nil }
    title { 'MyString' }
    description { 'MyText' }
    link_url { 'MyString' }
    published_at { '2025-01-04 00:58:45' }
  end
end
