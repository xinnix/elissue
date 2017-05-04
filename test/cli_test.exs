defmodule CliTest do
  use ExUnit.Case

  import Issues.CLI , only: [parse_args: 1]


  test ":help returned by option with -h" do
    assert parse_args(["-h","anything"]) == :help
    assert parse_args(["--help","anything"]) == :help
  end

  test "three values return if three given" do
    assert parse_args(["user","project","99"]) == {"user","project",99}
  end

  test "return default count" do
    assert parse_args(["user","project"]) == {"user","project",4}
  end
end
