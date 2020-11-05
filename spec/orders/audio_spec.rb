require 'spec_helper'
require 'orders/audio'

RSpec.describe Orders::Audio do
  subject { Orders::Audio.new.display_results(amount) }

  context 'when amount is 0' do
    let(:amount) { 0 }

    it 'should raise error' do
      expect { subject }.to raise_error(StandardError, "Amount should be greater than 0")
    end
  end

  context 'when amount is not matching bundle package' do
    let(:amount) { 7 }

    it 'should raise error' do
      expect { subject }.to raise_error(StandardError, "Sorry, we have no matched bundles for #{Orders::Audio::FORMAT} with your order amount 7")
    end
  end

  context 'when amount is matching bundle package' do
    let(:amount) { 12 }

    it 'should not raise error' do
      good_bundle = Orders::Audio::BUNDLE_PACKAGES[9] + Orders::Audio::BUNDLE_PACKAGES[3]
      bad_bundle = Orders::Audio::BUNDLE_PACKAGES[6] + Orders::Audio::BUNDLE_PACKAGES[6]
      expect { subject }.not_to raise_error
      expect(subject).to include("#{amount} #{Orders::Audio::FORMAT} $#{good_bundle}")
      expect(subject).not_to include("#{amount} #{Orders::Audio::FORMAT} $#{bad_bundle}")
    end
  end
end
