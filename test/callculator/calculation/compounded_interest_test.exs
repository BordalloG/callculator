defmodule Callculator.Calculation.CompoundedInterestTest do
  use ExUnit.Case
  alias Callculator.Calculation.CompoundedInterest

  test  "compounded interest calculation return correct response" do
    initial_value = 10000
    interest_rate = 13
    period = 2
    assert CompoundedInterest.default_calculation(initial_value, interest_rate, period) == 12769.00
  end
end
