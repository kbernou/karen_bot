defmodule Karen.Consumer do
  use Nostrum.Consumer

  alias Nostrum.Api
  alias Karen.Consumer.Command
  alias Karen.Helper

  @spec start_link :: Supervisor.on_start()
  def start_link do
    Consumer.start_link(__MODULE__)
  end

  @impl true
  @spec handle_event(Nostrum.Consumer.event()) :: any()
  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    # get the root command
    case :binary.match(msg.content, " ") do
      {start, _} ->
        fn ->
          cmd = String.slice(msg.content, 0, start)
          Command.handle(cmd, msg)
          # TODO ...then do what?
        end

      # provide some feedback about things going wrong
      :nomatch ->
        Api.create_message(msg.channel_id, "Bad command, master.")
    end
  end

  # Default event handler, consumer will crash without a method definition for
  # each event type
  def handle_event(_event) do
    :noop
  end
end
