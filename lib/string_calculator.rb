class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    
    delimiter, numbers_to_parse = extract_delimiter_and_numbers(numbers)
    numbers_array = parse_numbers(numbers_to_parse, delimiter)
    
    check_for_negative_numbers(numbers_array)
    
    numbers_array.sum
  end
  
  private
  
  def extract_delimiter_and_numbers(input)
    if input.start_with?("//")
      delimiter_spec, numbers_part = input.split("\n", 2)
      delimiter = delimiter_spec[2..-1]
      return delimiter, numbers_part
    end
    
    return ",", input
  end
  
  def parse_numbers(numbers_string, delimiter)
    normalized_input = numbers_string.gsub("\n", delimiter)
    normalized_input.split(delimiter).map(&:to_i)
  end
  
  def check_for_negative_numbers(numbers)
    negatives = numbers.select { |n| n < 0 }
    
    if negatives.any?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end
  end
end
