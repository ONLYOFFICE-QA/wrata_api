# frozen_string_literal: true

require 'spec_helper'

describe WrataApi::WrataApi, '#available?' do
  it 'WrataApi#available? is true for correct url' do
    correct_api = described_class.new

    stub_request(:get, "#{correct_api.uri}/signin")
      .to_return(body: 'Runner')

    expect(correct_api).to be_available
  end

  it 'WrataApi#available? is false for incorrect url' do
    incorrect_url_config = "#{Dir.pwd}/configs/incorrec_url.yaml"
    correct_api = described_class.new(incorrect_url_config)
    expect(correct_api).not_to be_available
  end
end
