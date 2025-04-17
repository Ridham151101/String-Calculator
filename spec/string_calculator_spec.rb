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

    context 'with multiple comma-separated numbers' do
      it 'returns the sum of all numbers' do
        expect(calculator.add('1,2,3,4,5')).to eq(15)
      end
    end

    context 'with newline delimiters' do
      it 'treats newlines as delimiters' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'with custom delimiters' do
      it 'supports custom delimiters defined in the format //[delimiter]\\n' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'with advanced delimiter formats' do
      it 'handles multiple character delimiters like "//;;;\n1;;;2"' do
        expect(calculator.add("//;:;:\n1;:;:2")).to eq(3)
      end
      
      it 'handles delimiters with brackets like "//[***]\n1***2***3"' do
        expect(calculator.add("//*#*#\n6*#*#2*#*#3")).to eq(11)
      end
      
      it 'handles special regex characters in delimiters' do
        expect(calculator.add("//.:.:\n1.:.:3.:.:3")).to eq(7)
      end
    end

    context 'with negative numbers' do
      it 'throws an exception for negative numbers' do
        expect { calculator.add("1,-2") }.to raise_error(
          RuntimeError, "negative numbers not allowed -2"
        )
      end
      
      it 'includes all negative numbers in the exception message' do
        expect { calculator.add("-1,2,-3,4,-5") }.to raise_error(
          RuntimeError, "negative numbers not allowed -1,-3,-5"
        )
      end
    end
  end
end
