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
    concerts
  end

  def concerts_before(date, concerts) do
    concerts
  end
end
