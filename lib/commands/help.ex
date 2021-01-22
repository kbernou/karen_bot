defmodule Karen.Consumer.Command.Help do
  alias Nostrum.Api

  def handle(msg) do
    out = """
    Here are my commands:
    * help - Tells you what I can do. Duh.
    * ping - Tells you if I'm alive.
    * graph - Produces a diagram from text. Refer to GraphViz docs for usage.
    """

    Api.create_message(msg.channel_id, out)
  end
end
