defmodule TestMailtrapTest do
  use ExUnit.Case
  doctest TestMailtrap

  test "greets the world" do
    assert TestMailtrap.hello() == :world
  end
end
