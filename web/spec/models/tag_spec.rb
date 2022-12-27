# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'responses' do
    it { is_expected.to respond_to(:user_id) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:position) }
  end

  describe 'validations' do
    subject { build(:tag) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:user_id).case_insensitive }
  end
end
