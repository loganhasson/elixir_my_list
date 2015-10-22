defmodule LearnElixir.MyList do
  # TODO: Keep tail call optimization in mind.
  # my_length/1, map/2, and sum/1 won't be tail call optimized
  def my_length([]), do: 0
  def my_length([_head|tail]), do: 1 + length(tail)

  def map([], _func), do: []
  def map([h|t], func) do
    result = func.(h)
    [result|map(t, func)]
  end

  def each([], _func), do: :ok
  def each([h|t], func) do
    func.(h)
    each(t, func)
  end

  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)

  def reduce([], _func, acc), do: acc
  def reduce([h|t], func, acc) do
    result = func.(acc, h)
    reduce(t, func, result)
  end

  # There's probably a better way
  def reverse([]), do: reverse([], [])
  def reverse([h|t]), do: reverse([h|t], [])
  def reverse([], acc), do: acc
  def reverse([h|t], acc) do
    acc = [h|acc]
    reverse(t, acc)
  end
end
