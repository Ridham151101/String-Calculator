require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    context 'with empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'with a single number' do
      it 'returns the number itself' do
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'with two comma-separated numbers' do
      it 'returns the sum of the numbers' do
        expect(calculator.add('1,5')).to eq(6)
      end
    end
  end
end
