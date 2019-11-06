defmodule Markdown do
  @moduledoc """
    Markdown to HTML processor, of the lowest order.
  """

  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(markdown) do
    parse(String.split(markdown, "\n"), {:not_in_list, []})
    |> Enum.reverse()
    |> Enum.join()
  end

  # A 'manual' reduce through recursion is pretty standard Elixir.
  # I used to prefer to call Enum.reduce(), but these days I find pattern matching
  # function heads and recursion easier to follow.

  # Here the state we need to pass is whether we're in a list or not.
  # We can drop a few function heads if we alter this to passing around a binary -- "</ul>"
  # but I prefer the explicitness.

  defp parse([], {:not_in_list, parsed}), do: parsed
  defp parse([], {:in_list, parsed}), do: ["</ul>" | parsed]

  defp parse(["*" <> subline | lines], {:not_in_list, parsed}),
    do: lines |> parse({:in_list, ["<ul><li>" <> parse_subline(subline) <> "</li>" | parsed]})

  defp parse(["*" <> subline | lines], {:in_list, parsed}),
    do: lines |> parse({:in_list, ["<li>" <> parse_subline(subline) <> "</li>" | parsed]})

  defp parse([line | lines], {:not_in_list, parsed}),
    do: lines |> parse({:not_in_list, [parse_prefixed(line) | parsed]})

  defp parse([line | lines], {:in_list, parsed}),
    do: lines |> parse({:not_in_list, ["</ul>" <> parse_prefixed(line) | parsed]})

  defp parse_prefixed("######" <> subline), do: subline |> wrap("h6")
  defp parse_prefixed("#####" <> subline), do: subline |> wrap("h5")
  defp parse_prefixed("####" <> subline), do: subline |> wrap("h4")
  defp parse_prefixed("###" <> subline), do: subline |> wrap("h3")
  defp parse_prefixed("##" <> subline), do: subline |> wrap("h2")
  defp parse_prefixed("#" <> subline), do: subline |> wrap("h1")
  defp parse_prefixed("" <> subline), do: subline |> wrap("p")

  defp wrap(subline, element),
    do: "<#{element}>#{parse_subline(subline)}</#{element}>"

  defp parse_subline(subline) do
    subline
    |> String.replace(~r/__(.*?)__/, "<strong>\\1</strong>")
    |> String.replace(~r/_(.*?)_/, "<em>\\1</em>")
    |> String.trim()
  end
end
