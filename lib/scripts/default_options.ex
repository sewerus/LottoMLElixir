defmodule Scripts.DefaultOptions do
  @analysed_draws_in_prediction 30
  @taken_draws_as_training_set 1000
  @taken_draws_as_testing_set 100
  @available_numbers_in_draw 49
  @data_source_file_name "duzy_lotto"
  @number_of_children 20
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

  defmacro analysed_draws_in_prediction, do: @analysed_draws_in_prediction
  defmacro taken_draws_as_training_set, do: @taken_draws_as_training_set
  defmacro taken_draws_as_testing_set, do: @taken_draws_as_testing_set
  defmacro available_numbers_in_draw, do: @available_numbers_in_draw
  defmacro data_source_file_name, do: @data_source_file_name
  defmacro number_of_children, do: @number_of_children
  defmacro elements_in_draw, do: @elements_in_draw
  defmacro single_cost, do: @single_cost
  defmacro prizes, do: @prizes |> Macro.escape()
end
