# frozen_string_literal: true

require 'spec_helper'

describe 'My behaviour' do
  test_file = '/home/lobashov-2/RubymineProjects/'\
              'OnlineDocuments/spec/studio/run_test_single_spec.rb'
  server1 = 'wrata-staging-1'
  server2 = 'wrata-staging-2'
  let(:api) { WrataApi::WrataApi.new }

  it 'WrataApi#available?' do
    expect(api).to be_available
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

  it 'WrataApi#add_to_queue' do
    expect(api.add_to_queue(test_file)).to be_a(Hash)
  end

  it 'WrataApi#add_tests_to_queue' do
    expect(api.add_tests_to_queue([test_file])).to be_a(Array)
  end

  it 'WrataApi#tests_in_queue is list' do
    api.add_to_queue(test_file)
    expect(api.tests_in_queue).not_to be_empty
  end

  it 'WrataApi#clear_tests_list responded' do
    expect(api.clear_tests_list).to be_a(Hash)
  end
end
