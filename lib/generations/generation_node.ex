defmodule Generations.GenerationNode do
  require Scripts.DefaultOptions

  @doc ~S"""
  Returns children nodes. A child is generated by adding a random matrix to present and absent weights.

  ## Examples

      iex> Generations.GenerationNode.children(
      ...>  Matrex.new([[1, 2, 3, 4, 5, 6], [7, 8, 9, 10, 11, 12]]),
      ...>  Matrex.new([[12, 11, 10, 9, 8, 7], [6, 5, 4, 3, 2, 1]]),
      ...>  %{ number_of_children: 2}
      ...> ) |> length()
      2
  """
  def children(present_weights, absent_weights, options \\ %{}) do
    number_of_children =
      options[:number_of_children] || Scripts.DefaultOptions.number_of_children()

    for _i <- 1..number_of_children, do: child(present_weights, absent_weights)
  end

  defp child(present_weights, absent_weights) do
    {rows, cols} = Matrex.size(present_weights)

    %{
      present_weights: present_weights |> Matrex.add(child_random_difference(rows, cols)),
      absent_weights: absent_weights |> Matrex.add(child_random_difference(rows, cols))
    }
  end

  defp child_random_difference(rows, cols) do
    Matrex.random(rows, cols) |> Matrex.add(-0.5)
  end
end
