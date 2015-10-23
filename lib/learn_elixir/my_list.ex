defmodule LearnElixir.MyList do
  # TODO: Keep tail call optimization in mind.
  # my_length/1, map/2, and sum/1 won't be tail call optimized

  @moduledoc """
  Perform some standard operations on a list
  """

  @doc """
  Returns the length of a list

  ## Examples

      iex> LearnElixir.MyList.my_length([])
      0

      iex> LearnElixir.MyList.my_length([1, 2, 3])
      3
  """
  def my_length([]), do: 0
  def my_length([_head|tail]), do: 1 + length(tail)

  @doc """
  Returns the result of running a function against every element
  in a list

  ## Examples

      iex> LearnElixir.MyList.map([], &(&1 * &1))
      []

      iex> LearnElixir.MyList.map([1, 2, 3], &(&1 * &1))
      [1, 4, 9]
  """
  def map([], _func), do: []
  def map([h|t], func) do
    result = func.(h)
    [result|map(t, func)]
  end

  @doc """
  Iterates through a list and runs a function against every element,
  returning :ok

  ## Examples

      iex> LearnElixir.MyList.each([], &(IO.puts &1))
      :ok

      iex> LearnElixir.MyList.each([1, 2, 3], &(&1))
      :ok
  """
  def each([], _func), do: :ok
  def each([h|t], func) do
    func.(h)
    each(t, func)
  end

  @doc """
  Returns the result of summing every element in a list

  ## Examples

      iex> LearnElixir.MyList.sum([])
      0

      iex> LearnElixir.MyList.sum([1, 2, 3])
      6
  """
  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)

  @doc """
  Reduces a list using the given function, returning the result

  ## Examples

      iex> LearnElixir.MyList.reduce([], 0, &(&1 - &2))
      0

      iex> LearnElixir.MyList.reduce([1, 2, 3], 0, &(&1 - &2))
      -6
  """
  def reduce([], acc, _func), do: acc
  def reduce([h|t], acc, func) do
    result = func.(acc, h)
    reduce(t, result, func)
  end

  @doc """
  Reverses a list

  ## Examples

      iex> LearnElixir.MyList.reverse([])
      []

      iex> LearnElixir.MyList.reverse(["hello", "world"])
      ["world", "hello"]
  """
  def reverse([]), do: reverse([], [])
  def reverse([h|t]), do: reverse([h|t], [])
  def reverse([], acc), do: acc
  def reverse([h|t], acc) do
    acc = [h|acc]
    reverse(t, acc)
  end
end
