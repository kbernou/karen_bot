defmodule Karen.Consumer.Command.AtMe do
  alias Nostrum.Api
  def handle(msg) do
    out = "Don't @ me, bro"

    Api.create_message(msg.channel_id, out)
  end
end
