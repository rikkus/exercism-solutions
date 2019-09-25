defmodule Bob do
  def hey(input) do
    cond do
      Regex.match?(~r/\?$/, input) -> "Sure."
      Regex.match?(~r/\p{Lu}/u, input) && !Regex.match?(~r/\p{Ll}/u, input) -> "Whoa, chill out!"
      String.trim(input) == "" -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end
end
