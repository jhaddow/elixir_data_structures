defmodule ConversionsTest do
  use ExUnit.Case
  doctest ElixirDataStructures

  test "converts a list of tuples to a map" do
    list = [{:one, "foo"}, {:two, "bar"}]
    expected = %{one: "foo", two: "bar"}
    assert Conversions.list_to_map(list) == expected
  end

  # When the above works, this one will too.
  # This is just to show that a keyword list is the same thing
  # as a list of doubles (tuple with 2 elements)
  test "converts a keyword list to a map" do
    keyword_list = [one: "foo", two: "bar"]
    expected = %{one: "foo", two: "bar"}
    assert Conversions.list_to_map(keyword_list) == expected
  end

  test "converts a keyword list to a map, but only when the value starts with 'b'" do
    keyword_list = [one: "foo", two: "bar", three: "baz"]
    expected = %{two: "bar", three: "baz"}
    assert Conversions.list_to_map_with_b_values(keyword_list) == expected
  end

  test "convert a map to a list of tuples" do
    map = %{one: "foo", two: "bar"}
    expected = [{:one, "foo"}, {:two, "bar"}]
    assert Conversions.map_to_list(map) == expected
  end

  test "converts a list of tuples to map, but removes any where the map would have a duplicate value" do
    # {:one, "foo"} and {:three, "foo"} both contain "foo", so don't include {:three, "foo"} in the map.
    list = [{:one, "foo"}, {:two, "bar"}, {:three, "foo"}, {:four, "baz"}]
    expected = %{one: "foo", two: "bar", four: "baz"}
    assert Conversions.list_to_map_with_unique_values(list) == expected
  end

  test "converts a map to a list, but only if the value in the map is an even number" do
    map = %{foo: 1917, bar: 2196, baz: 4081, big: 2571442}
    expected = [{:bar, 2196}, {:big, 2571442}]
    assert Conversions.map_to_list_with_even_values(map) == expected
  end



end
