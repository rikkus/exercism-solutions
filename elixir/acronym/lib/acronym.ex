defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.replace(~r/[^A-Za-z]([a-z])/, string, fn(s) -> String.upcase(s) end)
    |> String.replace(~r/[^A-Z]/, "")
  end
end
