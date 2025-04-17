# String Calculator TDD Kata

This repository contains my solution to the String Calculator TDD kata.

## Requirements

- Ruby version: 3.2.0
- RSpec for testing

## Running the tests

## Installation
```
git clone git@github.com:Ridham151101/String-Calculator.git
cd string-calculator
bundle install
```

## Running the tests
```bundle exec rspec```

## Implementation Details

### The StringCalculator class implements an add method with the following functionality:

1. Takes a string input of numbers with delimiters
2. Returns the sum of the numbers
3. Handles empty strings (returns 0)
4. Handles single numbers
5. Supports comma-separated values
6. Accepts newlines as delimiters
7. Supports custom delimiters specified in the format //[delimiter]\n[numbers]
8. Handles multi-character delimiters
9. Throws exceptions for negative numbers with appropriate error messages


## TDD Process

### This implementation was developed using Test-Driven Development principles:

1. Write a failing test
2. Implement the minimal code to make the test pass
3. Refactor while keeping tests passing
4. Repeat

Each commit in the repository represents a step in this TDD cycle, showing the evolution of the code.

## Code Structure

`lib/string_calculator.rb:` Contains the StringCalculator class
`spec/string_calculator_spec.rb:` Contains RSpec tests

## Examples
```
calculator = StringCalculator.new

calculator.add("")                # => 0
calculator.add("1")               # => 1
calculator.add("1,5")             # => 6
calculator.add("1\n2,3")          # => 6
calculator.add("//;\n1;2")        # => 3
calculator.add("//[***]\n1***2")  # => 3

# Throws exception: "negative numbers not allowed -1,-2"
calculator.add("1,-1,2,-2")
```
