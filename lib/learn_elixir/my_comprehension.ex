defmodule LearnElixir.MyComprehension do
  import Integer, only: [is_even: 1]

  def evens(num)  do
    for num <- 1..num, is_even(num), do: num
  end

  def join(list, _sep) do
    for item <- list, into: "", do: "/#{item}"
  end
end
