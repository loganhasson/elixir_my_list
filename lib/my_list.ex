defmodule MyList do
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

defmodule MyFile do
  def filter_away(file) do
    case File.read(file) do
      {:ok, text} ->
        text
        |> String.split("\n")
        |> Stream.filter(&String.starts_with?(&1, "d"))
        |> Stream.take_every(2)
        |> Stream.map(&String.capitalize(&1))
        |> Enum.sort(&(String.length(&1) > String.length(&2)))
      {:error} ->
        :error
    end
  end
end

defmodule MyComprehension do
  import Integer, only: [is_even: 1]

  def evens(num)  do
    for num <- 1..num, is_even(num), do: num
  end

  def join(list, _sep) do
    for item <- list, into: "", do: "/#{item}"
  end
end

defmodule MySigils do
  import Kernel, except: [sigil_s: 2]

  def sigil_x(content, _opts) do
    content
    |> String.split(" ")
    |> Enum.map(&("BOO#{&1}EEK"))
  end

  def sigil_s(content, _opts) do
    content
  end

  def test_sigil_s(content) do
    ~s(#{content})
  end
end
