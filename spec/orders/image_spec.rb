require 'spec_helper'
require 'orders/image'

RSpec.describe Orders::Image do
  subject { Orders::Image.new.display_results(amount) }

  context 'when amount is 0' do
    let(:amount) { 0 }

    it 'should raise error' do
      expect { subject }.to raise_error(StandardError, "Amount should be greater than 0")
    end
  end

  context 'when amount is not matching bundle package' do
    let(:amount) { 6 }

    it 'should raise error' do
      expect { subject }.to raise_error(StandardError, "Sorry, we have no matched bundles for #{Orders::Image::FORMAT} with your order amount 6")
    end
  end

  context 'when amount is matching bundle package' do
    let(:amount) { 10 }

    it 'should not raise error' do
      expect { subject }.not_to raise_error
      expect(subject).to include("#{amount} #{Orders::Image::FORMAT} $#{Orders::Image::BUNDLE_PACKAGES[amount]}")
    end
  end
end
