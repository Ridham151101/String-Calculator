require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    context 'basic functionality' do
      it 'returns 0 for an empty string' do
        expect(calculator.add('')).to eq(0)
      end

      it 'returns the number for a single number' do
        expect(calculator.add('1')).to eq(1)
      end

      it 'returns the sum of two comma-separated numbers' do
        expect(calculator.add('1,5')).to eq(6)
      end

      it 'returns the sum of multiple comma-separated numbers' do
        expect(calculator.add('1,2,3,4,5')).to eq(15)
      end
    end
    
    context 'delimiter handling' do
      it 'treats newlines as delimiters' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
      
      it 'supports custom single-character delimiters' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end

      it 'handles multiple character delimiters' do
        expect(calculator.add("//;:;:\n1;:;:2")).to eq(3)
      end
      
      it 'handles multiple character delimiters' do
        expect(calculator.add("//*#*#\n6*#*#2*#*#3")).to eq(11)
      end
      
      it 'handles multiple character delimiters' do
        expect(calculator.add("//.:.:\n1.:.:3.:.:3")).to eq(7)
      end
    end

    context 'error handling' do
      it 'throws an exception for a single negative number' do
        expect { calculator.add("-1") }.to raise_error(
          RuntimeError, "negative numbers not allowed -1"
        )
      end
      
      it 'throws an exception for multiple negative numbers' do
        expect { calculator.add("-1,2,-3,4,-5") }.to raise_error(
          RuntimeError, "negative numbers not allowed -1,-3,-5"
        )
      end
    end
  end
end
