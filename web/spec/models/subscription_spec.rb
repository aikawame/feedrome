# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:feed) }
    it { is_expected.to have_many(:taggings).dependent(:destroy) }
    it { is_expected.to have_many(:tags).through(:taggings) }
  end

  describe 'responses' do
    it { is_expected.to respond_to(:user_id) }
    it { is_expected.to respond_to(:feed_id) }
    it { is_expected.to respond_to(:title) }
  end
end
