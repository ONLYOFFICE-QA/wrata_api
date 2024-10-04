# frozen_string_literal: true

require 'spec_helper'

describe WrataApi::WrataApi, '#server_list' do
  let(:api) { described_class.new }
  let(:free_pcs) { api.free_servers(2) }
  let(:size_of_server) { '1gb' }

  before do
    stub_request(:get, "#{api.uri}/servers.json")
      .to_return(body: '[{"name": "server1", "size": "1gb"}, {"name": "server2", "size": "1gb"}]')
    stub_request(:post, "#{api.uri}/servers/power_on")
      .with(body: { size: size_of_server }.to_json)
      .to_return(body: '{"status": "powered_on"}')
    stub_request(:get, "#{api.uri}/server_data?name=server1")
      .to_return(body: '{"name": "server1", "booked": true}')
    stub_request(:post, "#{api.uri}/servers/book")
      .to_return(body: '{"servers": [{"name": "server1", "booked": true}]}')
    stub_request(:post, "#{api.uri}/servers/unbook")
      .to_return(body: '{"servers": [{"name": "server1", "booked": false}]}')
    stub_request(:post, "#{api.uri}/servers/power_off")
      .to_return(body: '{"status": "powered_off"}')
    stub_request(:get, "#{api.uri}/servers/free?count=1000")
      .to_return(status: 400, body: '{"error": "NotEnoughServerCount"}')
  end

  it 'api.free_servers(2) object' do
    expect(free_pcs).to be_a(WrataApi::ServerList)
  end

  it 'api.free_servers(2) count' do
    expect(free_pcs.length).to eq(2)
  end

  it 'ServerList poweron' do
    free_pcs.power_on(size_of_server)
    expect(free_pcs).to be_powered_on
  end

  it 'ServerList return correct size of server' do
    expect(free_pcs.servers.first['size']).to eq(size_of_server)
  end

  it 'ServerList book' do
    servers = free_pcs.book
    expect(api.server_data(servers.first['name'])['booked']).not_to be_nil
  end

  it 'ServerList unbook' do
    servers = free_pcs.unbook
    expect(api.server_data(servers.first['name'])['booked']).to be_nil
  end

  it 'ServerList poweroff' do
    free_pcs.power_off
    expect(free_pcs).to be_powered_off
  end

  it 'Try to get free servers in great count' do
    expect { api.free_servers(1000) }
      .to raise_error(WrataApi::NotEnoughServerCount)
  end
end
