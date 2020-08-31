defmodule Bob do

  def hey(input) do

    input = String.trim(input)

    cond do
      is_upcase?(input) and String.ends_with?(input, "?") -> "Calm down, I know what I'm doing!"
      is_upcase?(input)                                   -> "Whoa, chill out!"
      input == ""                                         -> "Fine. Be that way!"
      String.ends_with?(input, "?")                       -> "Sure."
      true                                                -> "Whatever."
    end

  end

  defp is_upcase?(input),
    do: input == String.upcase(input) and input != String.downcase(input)

end
