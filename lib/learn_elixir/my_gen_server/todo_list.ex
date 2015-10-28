defmodule LearnElixir.MyGenServer.TodoList do
  use GenServer

  def start(initial_list \\ []) do
    {:ok, todo_list} = GenServer.start(__MODULE__, initial_list)
    todo_list
  end

  def add(todo_list, item) do
    GenServer.cast(todo_list, {:add, item})
  end

  def complete(todo_list, item) do
    GenServer.cast(todo_list, {:complete, item})
  end

  def list(todo_list) do
    GenServer.call(todo_list, :list)
  end

  def handle_cast({:add, item}, list) do
    {:noreply, [item|list]}
  end

  def handle_cast({:complete, item}, list) do
    index = Enum.find_index(list, fn (el) -> el == item end)
    {:noreply, list |> List.delete_at(index)}
  end

  def handle_call(:list, _from, list) do
    {:reply, Enum.reverse(list), list}
  end
end
