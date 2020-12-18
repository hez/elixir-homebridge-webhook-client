defmodule HomebridgeWebhookTest do
  use ExUnit.Case
  doctest HomebridgeWebhook

  test "greets the world" do
    assert HomebridgeWebhook.hello() == :world
  end
end
