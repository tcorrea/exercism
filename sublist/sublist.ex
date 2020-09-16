defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a == b, do: :equal
  def compare(a, b) when length(a) < length(b), do: if sublist?(a,b), do: :sublist, else: :unequal
  def compare(a, b) when length(a) > length(b), do: if sublist?(b,a), do: :superlist, else: :unequal
  def compare(_, _), do: :unequal

  defp sublist?(a, b) when length(a) <= length(b),
    do: if List.starts_with?(b, a), do: true, else: sublist?(a, tl(b))
  defp sublist?(_, _), do: false

end
