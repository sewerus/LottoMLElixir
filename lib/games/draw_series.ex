defmodule Games.DrawSeries do
  require Games.Game

  @doc ~S"""
  Returns total benefit for all draws. For example:
    1: [1, 2, 3]
    2: [2, 3, 4]
    3: [1, 2, 4] => predicted elements: [2, 3, 4] => benefit: 2 - 1 = 1
    4: [1, 2, 6] => predicted elements: [2, 3, 4] => benefit: 1 - 1 = 0
   Total benefit: 1 + 0 = 1

  ## Examples

      iex> Games.DrawSeries.total_benefit([MapSet.new([1, 2, 3]), MapSet.new([2, 3, 4]), MapSet.new([1, 2, 4]), MapSet.new([1, 2, 6])],
      ...>  Matrex.new([[1, 2, 3, 4, 5, 6], [7, 8, 9, 10, 11, 12]]),
      ...>  Matrex.new([[12, 11, 10, 9, 8, 7], [6, 5, 4, 3, 2, 1]]),
      ...>  %{available_numbers_in_draw: 6, elements_in_draw: 3, single_cost: 1, prizes: %{0 => 0, 1 => 1, 2 => 2, 3 => 3}})
      1

  """
  def total_benefit(all_draws, present_weights, absent_weights, options \\ %{}) do
    available_numbers_in_draw =
      options[:available_numbers_in_draw] || Games.Game.available_numbers_in_draw()

    elements_in_draw = options[:elements_in_draw] || Games.Game.elements_in_draw()
    single_cost = options[:single_cost] || Games.Game.single_cost()
    prizes = options[:prizes] || Games.Game.prizes()

    all_draws_matrix = all_draws |> Games.DrawSeries.draw_sets_to_matrix()
    needed_draws_for_weights = needed_draws_for_weights(present_weights)

    played_draws_indices(all_draws, needed_draws_for_weights)
    |> Enum.map(fn index ->
      predicted_elements =
        Games.ElementsPrediction.predict(
          draws_submatrix_for_index(
            index,
            all_draws_matrix,
            needed_draws_for_weights,
            available_numbers_in_draw
          ),
          present_weights,
          absent_weights,
          %{elements_in_draw: elements_in_draw}
        )

      Games.Draw.benefit(predicted_elements, all_draws |> Enum.at(index), %{
        prizes: prizes,
        single_cost: single_cost
      })
    end)
    |> Enum.sum()
  end

  @doc ~S"""
  Returns binary matrix of present elements in draws.

  ## Examples

      iex> Games.DrawSeries.draw_sets_to_matrix([MapSet.new([1, 2, 3, 4, 5, 6]), MapSet.new([1, 4, 5, 8, 9, 10])])
      Matrex.new([
      [1.0, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0,
       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
       0.0, 0.0, 0.0, 0.0],
      [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
       0.0, 0.0, 0.0, 0.0]
      ])

  """
  def draw_sets_to_matrix(draw_sets) do
    draw_sets
    |> Enum.reduce([], &add_set_to_matrix/2)
    |> Enum.reduce(fn a, b -> Matrex.concat(a, b, :rows) end)
  end

  defp add_set_to_matrix(new_set, rows) do
    rows ++ [Games.Draw.to_matrix(new_set)]
  end

  defp played_draws_indices(all_draws, needed_draws_for_weights) do
    needed_draws_for_weights..(length(all_draws) - 1)
  end

  defp needed_draws_for_weights(weights) do
    {rows, _} = Matrex.size(weights)
    rows
  end

  defp draws_submatrix_for_index(
         index,
         all_draws_matrix,
         needed_draws_for_weights,
         available_numbers_in_draw
       ) do
    all_draws_matrix
    |> Matrex.submatrix(
      (index - needed_draws_for_weights + 1)..index,
      1..available_numbers_in_draw
    )
  end
end
