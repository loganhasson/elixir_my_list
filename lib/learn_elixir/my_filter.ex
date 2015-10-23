defmodule LearnElixir.MyFilter do
  @moduledoc """
  A function that filters a sample file based on an exercise from LearnElixir.tv
  """

  @doc """
  Returns every other word that starts with a 'd', sorted by length

  ## Examples

      iex> LearnElixir.MyFilter.filter_away("sample.txt")
      ["Data base", "Diamond", "Drill", "Drum"]

      iex> LearnElixir.MyFilter.filter_away("fake_file.txt")
      :error
  """
  def filter_away(file) do
    case File.read(file) do
      {:ok, text} ->
        text
        |> String.split("\n")
        |> Stream.filter(&String.starts_with?(&1, "d"))
        |> Stream.take_every(2)
        |> Stream.map(&String.capitalize(&1))
        |> Enum.sort(&(String.length(&1) > String.length(&2)))
      {:error, _} ->
        :error
    end
  end
end
