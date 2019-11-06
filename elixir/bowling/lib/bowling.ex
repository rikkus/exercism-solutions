defmodule Bowling do
  @type game :: List.t()

  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """
  @spec start() :: List.t()
  def start, do: []

  @doc """
    Records the number of pins knocked down on a single roll. Returns `any`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful message.
  """
  @spec roll(game, integer) :: game | {:error, String.t()}

  def roll(_, roll) when roll < 0, do: {:error, "Negative roll is invalid"}
  def roll(_, roll) when roll > 10, do: {:error, "Pin count exceeds pins on the lane"}

  # Pre-last frame spare then more than cleanup
  def roll([[a] | rest], roll)
      when length(rest) < 9 and
             a != 10 and
             a + roll > 10,
      do: {:error, "Pin count exceeds pins on the lane"}

  # Last frame spare then more than cleanup
  def roll([[a, b] | rest], roll)
      when length(rest) == 9 and
             a == 10 and
             b != 10 and
             roll + b > 10,
      do: {:error, "Pin count exceeds pins on the lane"}

  # Game over scenario 1.
  def roll([[_, _, _] | more_frames], _roll)
      when length(more_frames) == 9,
      do: {:error, "Cannot roll after game is over"}

  # Game over scenario 2.
  def roll([[first, second] | more_frames], _roll)
      when length(more_frames) == 9 and
             first + second < 10,
      do: {:error, "Cannot roll after game is over"}

  # We're in the last frame
  def roll([last_frame | more_frames], roll)
      when length(more_frames) == 9,
      do: [last_frame ++ [roll] | more_frames]

  # We've had the first roll of a frame and it was a strike.
  def roll([[10] | more_frames], roll),
    do: [[roll], [10] | more_frames]

  # We've had the first roll of a frame and it wasn't a strike.
  def roll([[first] | more_frames], roll),
    do: [[first, roll] | more_frames]

  # Else: Just add a new frame with this roll
  def roll(frames, roll),
    do: [[roll] | frames]

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful message.
  """
  @spec score(game) :: integer | {:error, String.t()}
  def score(frames) when length(frames) < 10,
    do: {:error, "Score cannot be taken until the end of the game"}

  def score([[a, b] | frames])
      when length(frames) == 9 and
             a + b == 10,
      do: {:error, "Score cannot be taken until the end of the game"}

  def score([[a, b] | frames])
      when length(frames) == 9 and
             a == 10 and
             b == 10,
      do: {:error, "Score cannot be taken until the end of the game"}

  def score([[_] | frames])
      when length(frames) == 9,
      do: {:error, "Score cannot be taken until the end of the game"}

  def score(frames),
    do: do_score(frames |> Enum.reverse(), 0)

  defp do_score([], total), do: total

  defp do_score([[x, y, z]], total),
    do: do_score([], total + x + y + z)

  defp do_score([[x, y]], total),
    do: do_score([], total + x + y)

  # Strike followed by strike followed by something - adding second strike and next roll
  defp do_score([[10], [10], [x | xs] | frames], total),
    do: do_score([[10], [x | xs] | frames], total + 10 + 10 + x)

  # Strike followed by 2+roll frame. Adding 2 rolls
  defp do_score([[10], [x, y | _z] = frame | frames], total),
    do: do_score([frame | frames], total + 10 + x + y)

  # x+y is a spare, so we add the next roll to the total.
  defp do_score([[x, y], [a, b] | frames], total) when x + y == 10,
    do: do_score([[a, b] | frames], total + 10 + a)

  # x+y is a spare, so we add the next roll (10) to the total.
  defp do_score([[x, y], [10] | frames], total) when x + y == 10,
    do: do_score([[10] | frames], total + 10 + 10)

  # Just a normal roll - so adding x+y to score
  defp do_score([[x, y] | frames], total),
    do: do_score(frames, total + x + y)
end
