defmodule Karen.Consumer do
  use Nostrum.Consumer

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

    forKaren = msg.content
      |> String.downcase
      |> String.starts_with?("karen ")

    case forKaren do
      true ->
        cmd = Enum.at(String.split(msg.content, " "), 1)
        Command.handle(cmd, msg)
        :done

      # This likely wasn't a command for Karen, but might mention her
      false ->
        case String.contains?(msg.content, "<@!470388907834474497>") do
          true -> Command.AtMe.handle(msg)
          false -> :noop
        end
    end
  end

  # Default event handler, consumer will crash without a method definition for
  # each event type
  def handle_event(_event) do
    :noop
  end
end
