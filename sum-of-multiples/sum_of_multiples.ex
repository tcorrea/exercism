defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do

    Enum.map(factors, fn x -> multiples(limit, x)end)
      |> List.flatten()
      |> Enum.uniq()
      |> Enum.sum()

  end

  defp multiples(limit, factor) when factor >= limit, do: 0
  defp multiples(limit, factor) when factor < limit do
    Enum.map(1..div(limit-1, factor), fn x -> x*factor end)
  end

end
