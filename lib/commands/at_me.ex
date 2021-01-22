defmodule Karen.Consumer.Command.AtMe do
  alias Nostrum.Api
  # TODO these dirs could be handled better for sure...
  def handle(msg) do
    out = "Don't @ me, bro"

    Api.create_message(msg.channel_id, out)
  end
end
