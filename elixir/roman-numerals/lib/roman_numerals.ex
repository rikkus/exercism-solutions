defmodule RomanNumerals do
  @type mapping() :: {pos_integer(), charlist()}
  @mappings [
    {1000, 'M'},
    {900, 'CM'},
    {500, 'D'},
    {400, 'CD'},
    {100, 'C'},
    {90, 'XC'},
    {50, 'L'},
    {40, 'XL'},
    {10, 'X'},
    {9, 'IX'},
    {5, 'V'},
    {4, 'IV'},
    {1, 'I'}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer()) :: String.t()
  def numeral(number) do
    to_roman(number, @mappings, [])
  end

  @spec to_roman(pos_integer(), [mapping()], charlist()) :: String.t()
  def to_roman(0, _mappings, digits), do: digits |> to_string

  def to_roman(remaining, [{number, letters} | _other_mappings] = mappings, digits)
      when remaining >= number,
      do: to_roman(remaining - number, mappings, digits ++ letters)

  def to_roman(remaining, [{_number, _letters} | other_mappings], digits),
    do: to_roman(remaining, other_mappings, digits)
end
