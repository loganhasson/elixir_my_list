defmodule LearnElixir.MyComprehensionTest do
  use ExUnit.Case, async: true

  doctest LearnElixir.MyComprehension

  test "passing a non-number into LearnElixir.MyComprehension.evens" do
    assert_raise FunctionClauseError, fn ->
      LearnElixir.MyComprehension.evens("hello")
    end
  end
end
