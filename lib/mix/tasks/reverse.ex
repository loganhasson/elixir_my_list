defmodule Mix.Tasks.Reverse do
  @shortdoc "Reverse a sample list"

  @moduledoc """
  Call with the appropriate MIX_ENV:

      MIX_ENV=dev mix reverse
  """

  use Mix.Task

  @sample_list Application.get_env(:learn_elixir, :sample_list)

  def run(_) do
    LearnElixir.MyList.reverse(@sample_list)
    |> Enum.each(&IO.puts(&1))
  end
end
