require 'spec_helper'

describe 'My behaviour' do
  test_file = '/home/lobashov-2/RubymineProjects/'\
              'OnlineDocuments/spec/studio/run_test_single_spec.rb'
  let(:api) { WrataApi::WrataApi.new }

  it 'WrataApi#available?' do
    expect(api.available?).to be_truthy
  end

  it 'WrataApi#server' do
    expect(api.servers).to be_a(Array)
  end

  it 'WrataApi#servers_data responded' do
    expect(api.server_data('nct-at-1')['name']).to eq('nct-at-1')
  end

  it 'WrataApi#powering_status return on' do
    expect(api.powering_status('nct-at-1')).to eq(:on)
  end

  it 'WrataApi#powering_status return off' do
    expect(api.powering_status('nct-at-2')).to eq(:off)
  end

  it 'WrataApi#execute_test is falsey' do
    expect(api.executing_test?('nct-at-2')).to be_falsey
  end

  it 'WrataApi#unbook_server' do
    expect(api.unbook_server('nct-at-1')).to be_a(Hash)
  end

  it 'WrataApi#book_server' do
    expect(api.book_server('nct-at-1')).to be_a(Hash)
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
