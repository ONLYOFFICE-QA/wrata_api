# frozen_string_literal: true

require 'spec_helper'

describe WrataApi::WrataApi, '#file_list' do
  let(:api) { described_class.new }

  it 'file_tree return array' do
    expect(api.file_list(project)).to be_a(Array)
  end
end
