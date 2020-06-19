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
    IO.puts(msg.content)

    case :binary.match(String.downcase(msg.content), "karen ") do
      {_, cmd_start} ->
        cmd = String.slice(msg.content, cmd_start, String.length(msg.content))
        Command.handle(cmd, msg)
        :done

      # This likely wasn't a command for Karen
      :nomatch ->
        :noop
    end
  end

  # Default event handler, consumer will crash without a method definition for
  # each event type
  def handle_event(_event) do
    :noop
  end
end
