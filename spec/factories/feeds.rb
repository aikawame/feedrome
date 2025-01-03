# frozen_string_literal: true

FactoryBot.define do
  factory :feed do
    source_url { 'MyString' }
    title { 'MyString' }
    description { 'MyText' }
    langage_code { 'MyString' }
    link_url { 'MyString' }
    modified_at { '2025-01-03 15:32:25' }
    crawled_at { '2025-01-03 15:32:25' }
  end
end
