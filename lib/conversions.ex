defmodule Conversions do
  import Integer

  @moduledoc """
  Let's convert some data structures!

  Each of these functions currently returns the arg.
  Check out the corresponding test and edit the function to return the result the test is
  expecting.
  """

  def list_to_map(list) do
    Enum.into(list, %{})
  end

  def list_to_map_with_b_values(list) do
    list
    |> Enum.filter(fn {_k, v} -> String.first(v) == "b" end)
    |> Enum.into(%{})
  end

  def map_to_list(map) do
    Enum.to_list(map)
  end

  def list_to_map_with_unique_values(list) do
    list
    |> Enum.uniq_by(fn {_k, v} -> v end)
    |> Enum.into(%{})
  end

  def map_to_list_with_even_values(map) do
    chunk_func = fn {k, v}, acc ->
      case Integer.is_even(v) do
        true -> {:cont, Enum.reverse([{k, v} | acc])}
        false -> {:cont, acc}
      end
    end

    after_func = fn acc -> {:cont, acc, []} end

    map
    |> Enum.chunk_while([], chunk_func, after_func)
    |> List.flatten()
  end
end
