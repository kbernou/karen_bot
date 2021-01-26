defmodule Karen.Consumer do
  use Nostrum.Consumer

  alias Karen.Consumer.Command
  alias Karen.Helper

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    IO.puts(msg.content)
    process_command(msg)
    process_mention(msg)

    :done
  end

  # Default event handler, consumer will crash without a method definition for
  # each event type
  def handle_event(_event) do
    :noop
  end

  defp process_command(msg) do
    if Helper.is_command?(msg.content) do
        msg.content
        |> String.split(" ")
        |> Enum.at(1)
        |> Command.handle(msg)
    end
  end

  defp process_mention(msg) do
    if Helper.mentions_karen?(msg.content) do
      Command.handle("atMe", msg)
    end
  end
end
