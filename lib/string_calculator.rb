class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter_spec, numbers_part = numbers.split("\n", 2)
      delimiter = delimiter_spec[2..-1]
      numbers = numbers_part.gsub(delimiter, ",")
    end
    
    numbers.gsub("\n", ",").split(',').map(&:to_i).sum
  end
end
