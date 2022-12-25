# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'responses' do
    it { is_expected.to respond_to(:firebase_uid) }
    it { is_expected.to respond_to(:name) }
  end

  describe 'validations' do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:firebase_uid) }
    it { is_expected.to validate_uniqueness_of(:firebase_uid) }
    it { is_expected.to allow_value('lHHWwQQw01hCIPJWdpRH624CxcG2').for(:firebase_uid) }
    it { is_expected.not_to allow_value('Invalid-Value_1234567890').for(:firebase_uid) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
