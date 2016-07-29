require 'spec_helper'

describe 'My behaviour' do
  let(:api) { WrataApi::WrataApi.new }

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
    expect(api.executing_test?('nct-at-1')).to be_falsey
  end

  it 'WrataApi#clear_tests_list responded' do
    expect(api.clear_tests_list).to be_a(Hash)
  end
end
