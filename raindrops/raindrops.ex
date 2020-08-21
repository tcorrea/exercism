defmodule Raindrops do

  @factors_data %{3 => "Pling", 5 => "Plang", 7 => "Plong"}
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(1), do: "1"
  def convert(number) do

    Enum.reduce([3,5,7], "", &(&2<>convert(number, &1))) |> either(number)

  end

  defp convert(number, factor) when rem(number, factor)==0, do: @factors_data[factor]
  defp convert(number, factor) when rem(number, factor)!=0, do: ""

  defp either("", number), do: Integer.to_string(number)
  defp either(noise, _), do: noise

end
