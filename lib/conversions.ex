defmodule Conversions do
  @moduledoc """
  Let's convert some data structures!
  """

  def list_to_map(list) do
    :maps.from_list(list)
  end

  def list_to_map_with_b_values(list) do
    Enum.reduce(list, %{}, fn({key, value}, acc) ->
      case String.first(value) do
        "b" -> Map.put(acc, key, value)
        _ -> acc
      end
    end)
  end

  def map_to_list(map) do
    Map.to_list(map)
  end

  def list_to_map_with_unique_values(list) do
    Enum.uniq_by(list, fn({_, item}) -> item end)
    |> list_to_map
  end

  def map_to_list_with_even_values(map) do
    Enum.reduce(map, [], fn({key, value}, acc) ->
      case rem(value, 2) do # modulo
        0 -> [{key, value} | acc]
        1 -> acc
      end
    end)
    |> Enum.reverse
  end
end
