defmodule ResistorColor do
  @moduledoc false

  @colors [
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  ]
  @spec colors() :: list(String.t())
  def colors, do: Enum.map(@colors, &(Atom.to_string(elem(&1,0))))

  @spec code(String.t()) :: integer()
  def code(color), do: @colors[String.to_atom(color)]

end
