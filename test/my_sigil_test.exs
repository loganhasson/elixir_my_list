defmodule LearnElixir.MySigilTest do
  use ExUnit.Case
  import LearnElixir.MySigil

  setup do
    content = "content"
    {:ok, content: content}
  end

  test "~x wraps a string with BOO and EEK" do
    assert ~x/hello/ == ["BOOhelloEEK"]
  end

  test "~s just returns the passed in content", %{content: content} do
    assert LearnElixir.MySigil.sigil_s(content, "stuff") == "#{content}"
  end
end
