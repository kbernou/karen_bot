defmodule KarenTest do
  use ExUnit.Case
  doctest Karen

  test "greets the world" do
    assert Karen.hello() == :world
  end
end
