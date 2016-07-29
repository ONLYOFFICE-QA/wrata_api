require 'spec_helper'

describe 'My behaviour' do
  let(:api) { WrataApi::WrataApi.new }

  it 'WrataApi#servers_data responded' do
    expect(api.server_data('nct-at-1')['servers_data'].length).to eq(1)
  end

  it 'WrataApi#clear_tests_list responded' do
    expect(api.clear_tests_list).to be_a(Hash)
  end
end
