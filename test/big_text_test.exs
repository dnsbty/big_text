defmodule BigTextTest do
  use ExUnit.Case
  doctest BigText

  test "greets the world" do
    assert BigText.hello() == :world
  end
end
