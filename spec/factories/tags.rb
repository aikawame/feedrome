# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    user { nil }
    name { 'MyString' }
    position { 1 }
  end
end
