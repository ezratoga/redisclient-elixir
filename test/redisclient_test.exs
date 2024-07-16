# defmodule RedisclientTest do
#  use ExUnit.Case
#  doctest Redisclient

#  test "greets the world" do
#    assert Redisclient.hello() == :world
#  end
#end

defmodule RedisClientTest do
  use ExUnit.Case
  doctest RedisClient

  setup do
    {:ok, _} = RedisClient.connect()
    :ok
  end

  test "set and get key" do
    assert {:ok, "Key set successfully"} = RedisClient.set_key("test_key", "test_value")
    assert {:ok, "test_value"} = RedisClient.get_key("test_key")
  end

  test "get non-existent key" do
    assert {:ok, "Key not found"} = RedisClient.get_key("non_existent_key")
  end
end