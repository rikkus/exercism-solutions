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
    |> to_charlist
    |> Enum.map(&rotate_character(&1, shift))
    |> List.to_string
  end

  defp rotate_character(c, shift) when c in ?A..?Z,
   do: ?A + rem(c - ?A + shift, 26)

  defp rotate_character(c, shift) when c in ?a..?z,
   do: ?a + rem(c - ?a + shift, 26)

  defp rotate_character(c, _shift), do: c
end
