# frozen_string_literal: true

require 'spec_helper'

describe WrataApi::WrataApi, '#profile' do
  let(:api) { described_class.new }
  let(:profile) { api.profile }

  before do
    stub_request(:get, "#{api.uri}/profile.json")
      .to_return(status: 200, body: '{"login": "login_name"}', headers: {})
  end

  it 'Profile data is returned' do
    expect(profile).to be_a(Hash)
  end

  it 'Profile data contains login name' do
    expect(profile['login']).to be_a(String)
  end
end
