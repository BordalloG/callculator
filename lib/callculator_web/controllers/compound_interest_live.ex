defmodule CallculatorWeb.CompoundInterestLive do
  use Phoenix.LiveView
  alias Callculator.Calculation.CompoundedInterest

  def render(assigns) do
    Phoenix.View.render(CallculatorWeb.CompoundInterestView, "index.html", assigns)
  end

   def mount(_params, _, socket) do

    socket = assign_socket(socket)

    {:ok, socket}
   end

   def handle_event("calculate", data , socket) do
    IO.puts("requested")
    %{"data" => %{"initial_balance" => initial_balance, "interest_rate" => interest_rate, "time_period" => time_period}} = data

    {initial_balance, _} = Integer.parse(initial_balance)
    {interest_rate, _} = Integer.parse(interest_rate)
    {time_period, _} = Integer.parse(time_period)

    result = CompoundedInterest.default_calculation(initial_balance, interest_rate, time_period)
    IO.puts("calculated")

    socket = assign_socket(socket, result, initial_balance, interest_rate, time_period)

    {:noreply, socket}
   end

   defp assign_socket(socket) do #TODO: Rename it
    assign_socket(socket, 0, 0, 0, 0)
   end

   defp assign_socket(socket, result, initial_balance, interest_rate, time_period) do
    socket
    |> assign(:result, result)
    |> assign(:initial_balance, initial_balance)
    |> assign(:interest_rate, interest_rate)
    |> assign(:time_period, time_period)
   end
end
