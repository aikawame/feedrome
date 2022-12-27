# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tagging do
  describe 'associations' do
    it { is_expected.to belong_to(:tag) }
    it { is_expected.to belong_to(:subscription) }
  end

  describe 'responses' do
    subject { build(:tagging) }

    it { is_expected.to respond_to(:tag_id) }
    it { is_expected.to respond_to(:subscription_id) }
    it { is_expected.to respond_to(:position) }
  end
end
