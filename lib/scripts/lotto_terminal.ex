defmodule Scripts.LottoTerminal do
  def run(g_target, options \\ %{}) do
    Generations.GenerationsRunner.start_running(g_target, &print/4, options)
  end

  defp print(
         g_index,
         g_target,
         %{
           present_weights: present_weights,
           absent_weights: absent_weights,
           score: score
         },
         testing_score
       ) do
    IO.puts("Generation #{g_index + 1} / #{g_target}")
    IO.puts("")
    IO.puts("Training score: #{score}")
    IO.puts("")
    IO.puts("Testing score: #{testing_score}")
    IO.puts("")
    IO.puts("Present weights:")
    Matrex.heatmap(present_weights, :color256)
    IO.puts("Absent weights:")
    Matrex.heatmap(absent_weights, :color256)
  end
end
