# main module
defmodule Main do
  def run do
    # connect to redis server
    {:ok, _conn} = RedisClient.connect()

    keyToSet = IO.gets("Enter the name of key: "); # input key name to redis-cli
    valueToSet = IO.gets("Enter the value of key: "); # input value of the key in redis-cli
    IO.puts("Setting key '#{keyToSet}' to '#{valueToSet}'")

    # setting key and value in redis-cli based on shell input
    case RedisClient.set_key(keyToSet, valueToSet) do
      {:ok, msg} -> IO.puts(msg)
      {:error, reason} -> IO.puts("Error setting key: #{reason}")
    end

    valueToGet = IO.gets("Enter the key to get the value: "); # input the key to get the value in redis-cli
    IO.puts("Getting key '#{valueToGet}'")

    # get the value of key in redis-cli
    case RedisClient.get_key(valueToGet) do
      {:ok, value} -> IO.puts("Value: #{value}")
      {:error, reason} -> IO.puts("Error getting key: #{reason}")
    end
  end
end

# Execute the script
Main.run()
