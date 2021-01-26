defmodule Karen.Helper do
  @doc """
  Returns true if the message is a command for Karen. Otherwise returns false.
  """
  def is_command?(content) do
    content
    |> String.downcase
    |> String.starts_with?("karen ")
  end

  @doc """
  Returns true if the `content` mentions Karen. Otherwise returns false.
  """
  def mentions_karen?(content) do
    content
    |> String.downcase
    |> String.contains?("<@!470388907834474497>")
  end
end
