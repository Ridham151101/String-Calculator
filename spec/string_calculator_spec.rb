require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    context 'with empty string' do
      it 'returns 0' do
        calculator = StringCalculator.new
        expect(calculator.add('')).to eq(0)
      end
    end
  end
end
