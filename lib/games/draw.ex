defmodule Games.Draw do
  require Games.Game

  @doc ~S"""
  Returns benefit of a draw based on prize and cost

  ## Examples

      iex> Games.Draw.benefit(MapSet.new([1, 2, 3, 4, 5, 6]), MapSet.new([1, 4, 5, 8, 9, 10]), %{prizes: %{0 => 0, 1 => 0, 2 => 0, 3 => 24, 4 => 100, 5 => 3000, 6 => 19000000}, single_cost: 4})
      20

      iex> Games.Draw.benefit(MapSet.new([1, 2, 3, 4, 5, 6]), MapSet.new([1, 4, 5, 6, 9, 10]), %{prizes: %{0 => 0, 1 => 0, 2 => 0, 3 => 24, 4 => 100, 5 => 3000, 6 => 19000000}, single_cost: 4})
      96

  """
  def benefit(elements, winning_elements, options \\ %{}) do
    prizes = options[:prizes] || Games.Game.prizes()
    single_cost = options[:single_cost] || Games.Game.single_cost()
    prize(elements, winning_elements, prizes) - single_cost
  end

  @doc ~S"""
  Returns number of matching elements

  ## Examples

      iex> Games.Draw.matching_elements(MapSet.new([1, 2, 3, 4, 5, 6]), MapSet.new([1, 4, 5, 8, 9, 10]))
      3

      iex> Games.Draw.matching_elements(MapSet.new([1, 2, 3, 4, 5, 6]), MapSet.new([1, 4, 5, 6, 9, 10]))
      4

  """
  def matching_elements(elements, winning_elements) do
    MapSet.intersection(elements, winning_elements) |> MapSet.size()
  end

  @doc ~S"""
  Returns matrix from set of elements

  ## Examples

      iex> Games.Draw.to_matrix(MapSet.new([1, 2, 3, 4, 5, 6]))
      Matrex.new([[1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]])

  """
  def to_matrix(elements) do
    Enum.reduce(
      elements,
      Matrex.zeros(1, Games.Game.available_numbers_in_draw()),
      fn number, row -> row |> Matrex.set(1, number, 1) end
    )
  end

  defp prize(elements, winning_elements, prizes) do
    prizes[matching_elements(elements, winning_elements)]
  end
end
