defmodule Karen.Consumer.Command.Ping do
  alias Nostrum.Api

  def handle(msg) do
    Api.create_message!(msg.channel_id, "Pong")
  end
end
