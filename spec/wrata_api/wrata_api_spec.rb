# frozen_string_literal: true

require 'spec_helper'

describe WrataApi::WrataApi do
  server1 = 'wrata-staging-1'
  server2 = 'wrata-staging-2'
  let(:api) { described_class.new }

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
