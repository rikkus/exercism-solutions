defmodule Zipper do
  defstruct [:focus_node, :thread]

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BinTree.t()) :: Zipper.t()
  def from_tree(bin_tree),
    do: %Zipper{thread: [], focus_node: bin_tree}

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Zipper.t()) :: BinTree.t()
  def to_tree(%Zipper{thread: [], focus_node: focus_node}),
    do: focus_node

  def to_tree(zipper),
    do: zipper |> up |> to_tree

  @doc """
  Get the value of the focus node.
  """
  @spec value(Zipper.t()) :: any
  def value(%Zipper{focus_node: %BinTree{value: value}}),
    do: value

  @spec child(Zipper.t(), :left | :right) :: Zipper.t()
  defp child(%Zipper{thread: thread, focus_node: focus_node}, direction),
    do: %Zipper{
      thread: [{direction, Map.get(focus_node, flip(direction)), focus_node.value} | thread],
      focus_node: Map.get(focus_node, direction)
    }

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Zipper.t()) :: Zipper.t() | nil
  def left(%Zipper{focus_node: %BinTree{left: nil}}),
    do: nil

  def left(zipper),
    do: zipper |> child(:left)

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Zipper.t()) :: Zipper.t() | nil
  def right(%Zipper{focus_node: %BinTree{right: nil}}),
    do: nil

  def right(zipper),
    do: zipper |> child(:right)

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Zipper.t()) :: Zipper.t() | nil
  def up(%Zipper{thread: []}),
    do: nil

  def up(%Zipper{
        thread: [{direction, other_direction_node, value} | remaining_thread],
        focus_node: focus_node
      }),
      do: %Zipper{
        thread: remaining_thread,
        focus_node:
          %BinTree{value: value}
          |> Map.put(direction, focus_node)
          |> Map.put(flip(direction), other_direction_node)
      }

  @spec set(Zipper.t(), :left | :right | :value, any) :: Zipper.t()
  defp set(zipper, key, new_value),
    do: %Zipper{zipper | focus_node: Map.put(zipper.focus_node, key, new_value)}

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Zipper.t(), any) :: Zipper.t()
  def set_value(zipper, value),
    do: set(zipper, :value, value)

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_left(zipper, left),
    do: set(zipper, :left, left)

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Zipper.t(), BinTree.t() | nil) :: Zipper.t()
  def set_right(zipper, right),
    do: set(zipper, :right, right)

  defp flip(:left), do: :right
  defp flip(:right), do: :left
end
