defmodule ProteinTranslation do

  @proteins %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP",
  }
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(<<codon::binary-size(3), rest::binary>>), do: of_codon(codon) |> of_rna(rest, [])

  def of_rna({:error, _}, _, _), do: {:error, "invalid RNA"}

  def of_rna({:ok, "STOP"}, _, acc), do: {:ok, acc}

  def of_rna({:ok, protein}, <<codon::binary-size(3), rest::binary>>, acc),
    do: of_codon(codon) |> of_rna(rest, acc ++ [protein])

  def of_rna({:ok, protein}, "", acc), do: {:ok, acc ++ [protein]}

  @doc """
  Given a codon, return the corresponding protein
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) when is_map_key(@proteins, codon), do: {:ok, @proteins[codon]}

  def of_codon(_), do: {:error, "invalid codon"}

end
