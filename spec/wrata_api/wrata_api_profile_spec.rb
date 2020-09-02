# frozen_string_literal: true

require 'spec_helper'

describe WrataApi::WrataApi, '#profile' do
  let(:api) { described_class.new }
  let(:profile) { api.profile }

  it 'Profile data is returned' do
    expect(profile).to be_a(Hash)
  end

  it 'Profile data contains login name' do
    expect(profile['login']).to be_a(String)
  end
end
