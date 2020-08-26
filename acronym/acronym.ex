defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do

    string
      |> String.replace(~r/[^[:alpha:][:space:]]/, "")
      |> (&(Regex.scan(~r/\b[[:alpha:]]|[[:upper:]](?=[[:lower:]])/,&1))).()
      |> Enum.join()
      |> String.upcase()

  end

end
