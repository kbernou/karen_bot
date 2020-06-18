defmodule Karen.Consumer.Command do
  alias Karen.Consumer.Command.{
    Ping,
    Help
  }

  def handle(command, message)

  def handle("ping", msg) do
    Ping.handle(msg)
  end

  def handle("help", _) do
    Help.handle()
  end

  def handle(_, _) do
    # What did they even send?
    "I don't understand."
  end
end
