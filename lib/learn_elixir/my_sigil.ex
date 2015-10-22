defmodule LearnElixir.MySigil do
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
