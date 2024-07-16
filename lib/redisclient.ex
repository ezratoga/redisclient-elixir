# lib/redisclient.ex
defmodule RedisClient do
  @moduledoc """
  Connect to Redis Server using Library REDIX
  """

  # function for connect to redis server
  def connect() do
    Redix.start_link("redis://localhost:6379/0", name: __MODULE__)
  end

  # function for set key redis in redis-cli
  def set_key(key, value) do
    case Redix.command(__MODULE__, ["SET", key, value]) do
      {:ok, "OK"} -> {:ok, "Key set successfully"}
      {:error, reason} -> {:error, reason}
    end
  end

  # function for get value of redis key in redis-cli
  def get_key(key) do
    case Redix.command(__MODULE__, ["GET", key]) do
      {:ok, nil} -> {:ok, "Key not found"}
      {:ok, value} -> {:ok, value}
      {:error, reason} -> {:error, reason}
    end
  end
end
