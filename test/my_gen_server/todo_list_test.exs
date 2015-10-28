defmodule LearnElixir.MyGenServer.TodoListTest do
  use ExUnit.Case
  alias LearnElixir.MyGenServer.TodoList, as: TodoList

  setup do
    my_list = TodoList.start
    {:ok, my_list: my_list}
  end

  test "starting a new list creates an empty list", %{my_list: my_list} do
    assert TodoList.list(my_list) === []
  end

  test "starting a new list with an existing list returns that list" do
    my_prefilled_list = TodoList.start(["hello"])

    assert TodoList.list(my_prefilled_list) === ["hello"]
  end

  test "adding to a list adds an item to the list", %{my_list: my_list} do
    TodoList.add(my_list, "Hello")
    TodoList.add(my_list, "World")

    assert TodoList.list(my_list) === ["Hello", "World"]
  end

  test "completing an item removes it from the list", %{my_list: my_list} do
    TodoList.add(my_list, "Hello")
    TodoList.add(my_list, "Blah")
    TodoList.add(my_list, "World")
    TodoList.complete(my_list, "Blah")

    assert TodoList.list(my_list) === ["Hello", "World"]
  end
end
