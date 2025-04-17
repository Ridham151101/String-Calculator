class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers.split("\n", 2)[1]
      numbers = numbers.gsub(delimiter, ",")
    end
    
    numbers.gsub("\n", ",").split(',').map(&:to_i).sum
  end
end
