defmodule Atoms do
  @moduledoc """
  Some example functions related to atoms
  """

  @doc "Convert an atom to a string"
  def atom_to_string(atom) do
    Atom.to_string(atom)
  end

  @doc """
  Atoms are not garbage collected, so you should avoid creating arbitrary atoms.
  Fortunately, there's a function that helps with this.
  """
  def string_to_atom(string) do
    String.to_existing_atom(string)
  end
end
