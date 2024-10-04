# frozen_string_literal: true

require 'spec_helper'

describe WrataApi::WrataApi do
  server1 = 'wrata-staging-1'
  server2 = 'wrata-staging-2'
  let(:api) { described_class.new }

  before do
    stub_request(:get, "#{api.uri}/servers.json")
      .to_return(body: '["wrata-staging-1", "wrata-staging-2"]')

    stub_request(:get, "#{api.uri}/runner/updated_data")
      .to_return(body: '["servers_data": { "name": "wrata-staging-1"}, { "name": "wrata-staging-2"}]')

    stub_request(:get, "#{api.uri}/server_data?name=#{server1}")
      .to_return(body: '{"name": "wrata-staging-1"}')

    stub_request(:get, "#{api.uri}/powering_status?name=#{server2}")
      .to_return(body: '{"status": "off"}')

    stub_request(:get, "#{api.uri}/executing_test?name=#{server2}")
      .to_return(body: '{"executing": false}')

    stub_request(:post, "#{api.uri}/servers/unbook")
      .with(body: { name: server1 }.to_json)
      .to_return(body: '{}')

    stub_request(:post, "#{api.uri}/servers/book")
      .with(body: { name: server1 }.to_json)
      .to_return(body: '{}')

    stub_request(:post, "#{api.uri}/servers/power_on")
      .with(body: { name: server1 }.to_json)
      .to_return(body: '{}')

    stub_request(:get, "#{api.uri}/powering_status?name=#{server1}")
      .to_return(body: '{"status": "on"}')

    stub_request(:post, "#{api.uri}/servers/power_off")
      .with(body: { name: server1 }.to_json)
      .to_return(body: '{}')
  end

  it 'WrataApi#server' do
    expect(api.servers).to be_a(Array)
  end

  it 'WrataApi#servers_data responded' do
    expect(api.server_data(server1)['name']).to eq(server1)
  end

  it 'WrataApi#powering_status return off' do
    expect(api.powering_status(server2)).to eq(:off)
  end

  it 'WrataApi#execute_test is falsey' do
    expect(api).not_to be_executing_test(server2)
  end

  it 'WrataApi#unbook_server' do
    expect(api.unbook_server(server1)).to be_a(Hash)
  end

  it 'WrataApi#book_server' do
    expect(api.book_server(server1)).to be_a(Hash)
  end

  it 'WrataAPI#power_on server' do
    expect(api.power_on_server(server1)).to be_nil
  end

  it 'WrataApi#powering_status return on' do
    expect(api.powering_status(server1)).to eq(:on)
  end

  it 'WrataAPI#power_off server' do
    expect(api.power_off_server(server1)).to be_nil
  end
end
