# frozen_string_literal: true

require 'spec_helper'

describe WrataApi::WrataApi, '#file_tree' do
  let(:api) { WrataApi::WrataApi.new }

  it 'file_tree return data by default' do
    api.file_tree(project)
  end
end
