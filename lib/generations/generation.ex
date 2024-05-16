defmodule Generations.Generation do
  def find_best_child(all_draws, present_weights, absent_weights, options \\ %{}) do
    number_of_children = options[:number_of_children] || 100

    Generations.GenerationNode.children(present_weights, absent_weights, %{
      number_of_children: number_of_children
    })
    |> Enum.map(fn child ->
      child
      |> Map.put_new(
        :score,
        Games.DrawSeries.total_benefit(
          all_draws,
          child[:present_weights],
          child[:absent_weights],
          options
        )
      )
    end)
    |> Enum.max_by(fn child -> child[:score] end)
  end
end
