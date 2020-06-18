defmodule Karen.Helper do
  def get_args(command) do
    {start, _} = :binary.match(command, " ")
    String.slice(command, start + 1, String.length(command))
  end
end
