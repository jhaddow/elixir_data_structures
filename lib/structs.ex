defmodule Structs do
  @moduledoc """
  An example using structs
  """

  defmodule Event do
    @moduledoc """
    Struct used in example
    """
    defstruct name: "",
              location: "",
              date: DateTime.from_unix!(0),
              rsvp: false
  end

  def concert_names(concerts) do
    Enum.map(concerts, fn(concert) ->
      concert.name
    end)
  end

  def concerts_before(date, concerts) do
    Enum.reduce(concerts, [], fn(concert, acc) ->
      case DateTime.compare(date, concert.date) do
        :gt -> [concert.name | acc]
        :lt -> acc
      end
    end)
    |> Enum.reverse
  end

end
