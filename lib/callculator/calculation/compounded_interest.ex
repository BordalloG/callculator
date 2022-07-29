defmodule Callculator.Calculation.CompoundedInterest do
  def default_calculation(initial_balance, interest_rate, time_period) do
    initial_balance * :math.pow((1 + interest_rate / 100), time_period)
    |> round
  end
end
