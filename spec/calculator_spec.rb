require 'spec_helper'
require 'calculator'

RSpec.describe Calculator do
  let(:input) {}

  subject { Calculator.run(input) }

  context 'invalid commands' do
    context 'when commands are not correct format' do
      let(:input) { 'xxx' }

      it 'will raise error' do
        expect { subject }.to raise_error(StandardError, "Command Format Error - An example input: 10 IMG 15 FLAC 13 VID")
      end
    end

    context 'when commands are not correct number of formats' do
      let(:input) { '10 IMG 5' }

      it 'will raise error' do
        expect { subject }.to raise_error(StandardError, "Command Format Error - An example input: 10 IMG 15 FLAC 13 VID")
      end
    end

    context 'when command include not correct number' do
      let(:input) { 'xx img' }

      it 'will raise error' do
        expect { subject }.to raise_error(StandardError, "xx is not a valid integer")
      end
    end
  end

  context 'valid commands' do
    let(:input) { '10 IMG 5 VID' }

    it 'should not raise error' do
      expect { subject }.not_to raise_error
    end
  end
end
