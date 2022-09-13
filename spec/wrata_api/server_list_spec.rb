# frozen_string_literal: true

require 'spec_helper'

describe WrataApi::ServerList do
  api = WrataApi::WrataApi.new
  free_pcs = api.free_servers(2)
  size_of_server = '1gb'

  it 'api.free_servers(2) object' do
    expect(free_pcs).to be_a(described_class)
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
