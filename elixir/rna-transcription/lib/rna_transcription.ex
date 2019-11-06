defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  def _transcribe_char(c) do
    case c do
      ?A -> ?U
      ?T -> ?A
      ?C -> ?G
      ?G -> ?C
    end
  end

  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna |> Enum.map(&_transcribe_char/1)
  end
end
