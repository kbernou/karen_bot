defmodule Karen.Consumer.Command do
@moduledoc """
Interface for commands.

Feels like there's a better way to handle this...
"""
  alias Nostrum.Api

  alias Karen.Consumer.Command.{
    Ping,
    Help,
    Graph,
    AtMe
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

  def handle("atMe", msg) do
    AtMe.handle(msg)
  end

  def handle(cmd, msg) do
    if String.contains?(msg.content, "<@!470388907834474497>") do
      AtMe.handle(msg)
    else
      IO.puts("Command issued: #{cmd}")
    Api.create_message(msg.channel_id, "That's not something I can do.")
    end
  end
end
