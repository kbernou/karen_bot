defmodule Karen.Consumer.Command do
  alias Nostrum.Api

  # is there a better way for it to know what commands are available?
  alias Karen.Consumer.Command.{
    Ping,
    Help,
    Graph
  }

  def handle(command, message)

  def handle("ping", msg) do
    Ping.handle(msg)
  end

  def handle("help", msg) do
    Help.handle(msg)
  end

  def handle("graph", msg) do
    Graph.handle(msg)
  end

  def handle(cmd, msg) do
    IO.puts("Command issued: #{cmd}")
    Api.create_message(msg.channel_id, "That's not something I can do.")
  end
end
