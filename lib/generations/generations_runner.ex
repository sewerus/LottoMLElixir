defmodule Generations.GenerationsRunner do
  require Scripts.DefaultOptions

  def start_running(g_target, show_results, options \\ %{}) do
    all_draws = options[:all_draws] || read_all_draws()
    present_weights = options[:present_weights] || default_weights(options)
    absent_weights = options[:absent_weights] || default_weights(options)

    run(
      g_target,
      0,
      all_draws,
      %{present_weights: present_weights, absent_weights: absent_weights},
      show_results,
      options
    )
  end

  defp run(g_target, g_index, _all_draws, child, _show_results, _options)
       when g_target == g_index do
    child
  end

  defp run(
         g_target,
         g_index,
         all_draws,
         %{present_weights: present_weights, absent_weights: absent_weights},
         show_results,
         options
       ) do
    best_child =
      Generations.Generation.find_best_child(all_draws, present_weights, absent_weights, options)

    show_results.(g_index, g_target, best_child)
    run(g_target, g_index + 1, all_draws, best_child, show_results, options)
  end

  defp read_all_draws(options \\ %{}) do
    file_name = options[:file] || Scripts.DefaultOptions.data_source_file_name()

    taken_draws_as_training_set =
      options[:taken_draws_as_training_set] ||
        Scripts.DefaultOptions.taken_draws_as_training_set()

    {:ok, data} = File.read("lib/data/#{file_name}.txt")

    data
    |> String.split("\r\n")
    |> Enum.reject(fn line -> String.trim(line) == "" end)
    |> Enum.map(&line_to_draw/1)
    |> Enum.take(-taken_draws_as_training_set)
  end

  defp line_to_draw(line) do
    line
    |> String.split(" ")
    |> List.last()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> MapSet.new()
  end

  defp default_weights(options) do
    available_numbers_in_draw =
      options[:available_numbers_in_draw] || Scripts.DefaultOptions.available_numbers_in_draw()

    analysed_draws_in_prediction =
      options[:analysed_draws_in_prediction] ||
        Scripts.DefaultOptions.analysed_draws_in_prediction()

    Matrex.fill(analysed_draws_in_prediction, available_numbers_in_draw, 0)
  end
end
