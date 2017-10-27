require 'rails_helper'

RSpec.describe Exporter do
  describe '#perform' do
    let(:exporter) { Exporter.new }

    it 'exports stuff' do
      expect(exporter.perform(true)).to eq true
    end
  end
end
