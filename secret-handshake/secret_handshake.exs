defmodule SecretHandshake do
  use Bitwise
  @values ["wink", "double blink", "close your eyes", "jump"]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    res = for i <- 0..3, bit_filled?(code, i), do: Enum.at(@values, i)
    if bit_filled?(code, 4) do
      Enum.reverse(res)
    else
      res
    end
  end

  @spec bit_filled?(code :: integer, i :: integer) :: boolean
  def bit_filled?(code, i) do
    flag = 1 <<< i
    (code &&& flag) == flag
  end
end

