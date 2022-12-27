# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item do
  describe 'responses' do
    it { is_expected.to respond_to(:feed_id) }
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:link_url) }
    it { is_expected.to respond_to(:published_at) }
  end

  describe 'validations' do
    it { is_expected.to allow_value('http://example.com/hoge').for(:link_url) }
    it { is_expected.to allow_value('https://example.com/fuga?uid=1234&tid=5678').for(:link_url) }
    it { is_expected.not_to allow_value("javascript:alert('Danger!!');//https://example.com/").for(:link_url) }
    it { is_expected.to allow_value(Time.zone.now).for(:published_at) }
  end
end
