defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do

    brackets = %{"(" => ")", "{" => "}", "[" => "]" }

    str
      |> String.replace(~r/[^\(\)\{\}\[\]]/, "")
      |> String.graphemes()
      |> Enum.reduce([], &(if brackets[List.first(&2)]==&1, do: tl(&2), else: [&1|&2]) )
      |> (&(if &1==[], do: true, else: false)).()

  end

end
