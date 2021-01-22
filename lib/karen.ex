defmodule Karen do
  use Application

  @impl true
  def start(_type, _args) do
    Karen.Supervisor.start_link
  end
end
