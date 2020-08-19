defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do

    Regex.scan(~r/[[:alpha:]]/, sentence) |> Enum.frequencies() |> Enum.all?(fn {_,n} -> n < 2 end)

  end
end
