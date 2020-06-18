defmodule Karen.Supervisor do
  def start_link do
    import Supervisor.Spec

    children = [Karen.Consumer]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
