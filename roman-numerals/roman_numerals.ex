defmodule RomanNumerals do

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number), do: numeral(number, "")

  defp numeral(n, r) when n>=1000, do: numeral(rem(n, 1000), "#{r}#{String.duplicate("M", div(n, 1000))}")
  defp numeral(n, r) when n>=900, do: numeral(rem(n, 900), "#{r}#{String.duplicate("CM", div(n, 900))}")
  defp numeral(n, r) when n>=500, do: numeral(rem(n, 500), "#{r}#{String.duplicate("D", div(n, 500))}")
  defp numeral(n, r) when n>=400, do: numeral(rem(n, 400), "#{r}#{String.duplicate("CD", div(n, 400))}")
  defp numeral(n, r) when n>=100, do: numeral(rem(n, 100), "#{r}#{String.duplicate("C", div(n, 100))}")
  defp numeral(n, r) when n>=90, do: numeral(rem(n, 90), "#{r}#{String.duplicate("XC", div(n, 90))}")
  defp numeral(n, r) when n>=50, do: numeral(rem(n, 50), "#{r}#{String.duplicate("L", div(n, 50))}")
  defp numeral(n, r) when n>=40, do: numeral(rem(n, 40), "#{r}#{String.duplicate("XL", div(n, 40))}")
  defp numeral(n, r) when n>=10, do: numeral(rem(n, 10), "#{r}#{String.duplicate("X", div(n, 10))}")
  defp numeral(n, r) when n>=9, do: numeral(rem(n, 9), "#{r}#{String.duplicate("IX", div(n, 9))}")
  defp numeral(n, r) when n>=5, do: numeral(rem(n, 5), "#{r}#{String.duplicate("V", div(n, 5))}")
  defp numeral(n, r) when n>=4, do: numeral(rem(n, 4), "#{r}#{String.duplicate("IV", div(n, 4))}")
  defp numeral(n, r) when n>=1, do: numeral(rem(n, 1), "#{r}#{String.duplicate("I", div(n, 1))}")
  defp numeral(n, r) when n==0, do: r


end
