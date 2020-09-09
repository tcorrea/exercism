defmodule RotationalCipher do

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do

    text
      |> to_charlist()
      |> Enum.reduce("", &("#{ &2 }#{ [encrypt(&1, shift)] |> to_string }"))

  end

  defp encrypt(char, shift) when char in ?A..?Z,
    do: rem(char + shift - ?A, 26) + ?A

  defp encrypt(char, shift) when char in ?a..?z,
    do: rem(char + shift - ?a, 26) + ?a

  defp encrypt(char, _), do: char

end
