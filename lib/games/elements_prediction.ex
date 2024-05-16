defmodule Games.ElementsPrediction do
  require Scripts.DefaultOptions

  @doc ~S"""
  Returns predicted elements with the biggest scores.
  For examples, let's take 2 draws with winning elements: 1, 2, 3 and 2, 3, 4.
  Draws are represented by a matrix:
  ┌                                                 ┐
  │     1.0     1.0     1.0     0.0     0.0     0.0 │
  │     0.0     1.0     1.0     1.0     0.0     0.0 │
  └                                                 ┘


  Matrix for present elements:
  ┌                                                 ┐
  │     1.0     2.0     3.0     4.0     5.0     6.0 │
  │     7.0     8.0     9.0    10.0    11.0    12.0 │
  └                                                 ┘
  Matrix for absent elements:
  ┌                                                 ┐
  │    12.0    11.0    10.0     9.0     8.0     7.0 │
  │     6.0     5.0     4.0     3.0     2.0     1.0 │
  └                                                 ┘
  Calculated scores are:
  1: 1*1.0 + 0*12.0 + 0*7.0 + 1*6.0 = 7
  2: 1*2.0 + 0*11.0 + 1*8.0 + 0*5.0 = 10
  3: 1*3.0 + 0*10.0 + 1*9.0 + 0*4.0 = 12
  4: 0*4.0 + 1*9.0 + 1*10.0 + 0*3.0 = 19
  5: 0*5.0 + 1*8.0 + 0*11.0 + 1*2.0 = 10
  6: 0*6.0 + 1*7.0 + 0*12.0 + 1*1.0 = 8
  Predicted elements are: 4, 3, 2 or 4, 3, 5 -> in this case we're taking 4, 3, 2


  ## Examples

      iex> Games.ElementsPrediction.predict(
      ...>  Matrex.new([[1, 1, 1, 0, 0, 0], [0, 1, 1, 1, 0, 0]]),
      ...>  Matrex.new([[1, 2, 3, 4, 5, 6], [7, 8, 9, 10, 11, 12]]),
      ...>  Matrex.new([[12, 11, 10, 9, 8, 7], [6, 5, 4, 3, 2, 1]]),
      ...>  %{elements_in_draw: 3})
      MapSet.new([4, 3, 2])

  """
  def predict(
        draws,
        present_weights,
        absent_weights,
        options \\ %{}
      ) do
    elements_in_draw = options[:elements_in_draw] || Scripts.DefaultOptions.elements_in_draw()
    present_values = Matrex.multiply(draws, present_weights)
    absent_values = Matrex.multiply(negated_matrix(draws), absent_weights)
    total_values = Matrex.add(present_values, absent_values)

    total_values
    |> Matrex.transpose()
    |> Matrex.list_of_rows()
    |> Enum.map(&Matrex.sum/1)
    |> Enum.with_index()
    |> Enum.sort(fn {x, _}, {y, _} -> y < x end)
    |> Enum.map(fn {_, index} -> index end)
    |> Enum.take(elements_in_draw)
    |> MapSet.new()
  end

  defp negated_matrix(matrix) do
    matrix |> Matrex.apply(fn value -> if value == 1, do: 0, else: 1 end)
  end
end
