defmodule Karen.Consumer.Command do
  alias Nostrum.Api

  alias Karen.Consumer.Command.{
    Ping,
    Help
  }

  def handle(command, message)

  def handle("ping", msg) do
    Ping.handle(msg)
  end

  def handle("help", msg) do
    Help.handle(msg)
  end

  def handle(_, msg) do
    Api.create_message(msg.channel_id, "That's not something I can do.")
  end
end
