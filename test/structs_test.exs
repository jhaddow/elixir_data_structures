defmodule StructsTest do
  use ExUnit.Case
  doctest ElixirDataStructures

  alias Structs.Event

  setup do
    concerts = [%Event{name: "Depeche Mode",
                       location: "Sacramento, CA",
                       date: get_date("2018-05-24T23:50:07Z"),
                       rsvp: true},
                %Event{name: "Rolling Stones",
                       location: "London, UK",
                       date: get_date("2018-06-01T17:42:01Z"),
                       rsvp: true},
                %Event{name: "Nickleback",
                       location: "Paris, FR",
                       date: get_date("2018-06-26T19:26:09Z"),
                       rsvp: false}]
    {:ok, concerts: concerts}
  end

  test "list of all bands playing", %{concerts: concerts} do
    expected = ["Depeche Mode", "Rolling Stones", "Nickleback"]
    assert Structs.concert_names(concerts) == expected
  end

  test "list of bands playing before June 15, 2018", %{concerts: concerts} do
    expected = ["Depeche Mode", "Rolling Stones"]
    actual = "2018-06-15T00:00:00Z"
             |> get_date
             |> Structs.concerts_before(concerts)
    assert actual == expected
  end

  defp get_date(str) do
    {:ok, datetime, 0} = DateTime.from_iso8601(str)
    datetime
  end

end
