require 'spec_helper'
require 'orders/video'

RSpec.describe Orders::Video do
  subject { Orders::Video.new.display_results(amount) }

  context 'when amount is 0' do
    let(:amount) { 0 }

    it 'should raise error' do
      expect { subject }.to raise_error(StandardError, "Amount should be greater than 0")
    end
  end

  context 'when amount is not matching bundle package' do
    let(:amount) { 7 }

    it 'should raise error' do
      expect { subject }.to raise_error(StandardError, "Sorry, we have no matched bundles for #{Orders::Video::FORMAT} with your order amount 7")
    end
  end

  context 'when amount is matching bundle package' do
    let(:amount) { 13 }

    it 'should not raise error' do
      bundle = 2 * Orders::Video::BUNDLE_PACKAGES[5] + Orders::Video::BUNDLE_PACKAGES[3]
      expect { subject }.not_to raise_error
      expect(subject).to include("#{amount} #{Orders::Video::FORMAT} $#{bundle}")
    end
  end
end
