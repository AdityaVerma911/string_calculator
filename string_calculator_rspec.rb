require 'rspec'
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  it "returns 0 for an empty string" do
    expect(calculator.add("")).to eq(0)
  end

  it "returns the number for a single number" do
    expect(calculator.add("1")).to eq(1)
  end

  it "returns the sum of two numbers" do
    expect(calculator.add("1,5")).to eq(6)
  end

  it "handles newlines between numbers" do
    expect(calculator.add("1\n2,3")).to eq(6)
  end

  it "supports custom delimiters" do
    expect(calculator.add("//;\n1;2")).to eq(3)
  end

  it "raises an exception for negative numbers" do
    expect { calculator.add("1,-2,3,-4") }
        .to raise_error("Negative numbers not allowed: -2, -4")
  end
end