defmodule LearnElixir.MyFilter do
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
