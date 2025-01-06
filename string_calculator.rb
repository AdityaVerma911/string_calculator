class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ","

    # Check for custom delimiter
    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = delimiter_line[2..-1]
    end

    # Replace newlines with the delimiter
    numbers = numbers.gsub("\n", delimiter)

    # Split numbers by the delimiter
    nums = numbers.split(delimiter).map(&:to_i)

    # Handle negative numbers
    negatives = nums.select { |num| num < 0 }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    # Return the sum of the numbers
    nums.sum
  end
end

# Usage Examples
calculator = StringCalculator.new

puts calculator.add("")
puts calculator.add("1")
puts calculator.add("1,5")
puts calculator.add("1\n2,3")
puts calculator.add("//;\n1;2")


# puts calculator.add("1,-2,3,-4")
