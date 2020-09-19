defmodule TriangleGuards do

  defguard is_equilateral(a,b,c) when a == b and a == c and b == c
  defguard is_isosceles(a,b,c) when a == b or a == c or b == c
  defguard is_scalene(a,b,c) when a != b and a != c and b != c
  defguard is_invalid_triangle(a,b,c) when (a+b) <= c or (a+c) <= b or (c+b) <= a
  defguard is_invalid_length(a,b,c) when a <= 0 or b <= 0 or c <= 0

end

defmodule Triangle do
  import TriangleGuards

  @type kind :: :equilateral | :isosceles | :scalene
  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when is_invalid_length(a,b,c),
    do: {:error, "all side lengths must be positive"}

  def kind(a, b, c) when is_invalid_triangle(a,b,c),
    do: {:error, "side lengths violate triangle inequality"}

  def kind(a, b, c) when is_equilateral(a,b,c), do: {:ok, :equilateral}

  def kind(a, b, c) when is_isosceles(a,b,c), do: {:ok, :isosceles}

  def kind(a, b, c) when is_scalene(a,b,c), do: {:ok, :scalene}

end
