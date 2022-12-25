# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feed do
  describe 'responses' do
    it { is_expected.to respond_to(:source_url) }
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:language_code) }
    it { is_expected.to respond_to(:link_url) }
    it { is_expected.to respond_to(:modified_at) }
    it { is_expected.to respond_to(:crawled_at) }
  end

  describe 'validations' do
    subject { build(:feed) }

    it { is_expected.to validate_presence_of(:source_url) }
    it { is_expected.to validate_uniqueness_of(:source_url).case_insensitive }
    it { is_expected.to allow_value('http://example.com/hoge').for(:source_url) }
    it { is_expected.to allow_value('https://example.com/fuga?uid=1234&tid=5678').for(:source_url) }
    it { is_expected.not_to allow_value("javascript:alert('Danger!!');//https://example.com/").for(:source_url) }
    it { is_expected.to allow_value('zh-tw').for(:language_code) }
    it { is_expected.not_to allow_value('Invalid1234').for(:language_code) }
    it { is_expected.to allow_value('http://example.com/hoge').for(:link_url) }
    it { is_expected.to allow_value('https://example.com/fuga?uid=1234&tid=5678').for(:link_url) }
    it { is_expected.not_to allow_value("javascript:alert('Danger!!');//https://example.com/").for(:link_url) }
    it { is_expected.to allow_value(Time.zone.now).for(:modified_at) }
    it { is_expected.to allow_value(Time.zone.now).for(:crawled_at) }
  end
end
