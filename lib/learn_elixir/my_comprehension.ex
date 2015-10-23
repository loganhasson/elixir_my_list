defmodule LearnElixir.MyComprehension do
  import Integer, only: [is_even: 1]

  @moduledoc """
  Some functions to play around with list comprehensions
  """

  @doc """
  Returns the even numbers up to a given limit

  ## Examples

    iex> LearnElixir.MyComprehension.evens(10)
    [2, 4, 6, 8, 10]
  """
  def evens(num)  do
    for num <- 1..num, is_even(num), do: num
  end

  @doc """
  Returns a binary joined by a separator, a la a path

  ## Examples

    iex> LearnElixir.MyComprehension.join(["hello", "world"], "/")
    "/hello/world"
  """
  def join(list, sep) do
    for item <- list, into: "", do: "#{sep}#{item}"
  end
end
