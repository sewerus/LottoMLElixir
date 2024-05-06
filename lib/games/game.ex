defmodule Games.Game do
  @available_numbers_in_draw 49
  @elements_in_draw 6
  @single_cost 3.0
  @prizes %{
    6 => 19_000_000,
    5 => 3_800,
    4 => 100,
    3 => 24,
    2 => 0,
    1 => 0,
    0 => 0
  }

  defmacro available_numbers_in_draw, do: @available_numbers_in_draw
  defmacro elements_in_draw, do: @elements_in_draw
  defmacro single_cost, do: @single_cost
  defmacro prizes, do: @prizes |> Macro.escape()
end
