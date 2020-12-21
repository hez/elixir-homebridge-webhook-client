defmodule HomebridgeWebhook do
  @moduledoc """
  Documentation for `HomebridgeWebhook`.
  """

  @type result :: Tesla.Env.result()
  @type client :: Tesla.Client.t()

  @path "/"

  @spec client(list()) :: client()
  def client(additional_middleware \\ []) do
    middleware =
      [
        {Tesla.Middleware.BaseUrl, base_url()},
        Tesla.Middleware.JSON,
        {Tesla.Middleware.BasicAuth, %{username: username(), password: password()}}
      ] ++ additional_middleware

    Tesla.client(middleware)
  end

  @spec get(client(), list()) :: result()
  def get(client, query_params \\ []), do: Tesla.get(client, @path, query: query_params)

  defp base_url, do: Application.get_env(:homebridge_webhook, :base_url, "http://localhost:51828")
  defp username, do: Application.get_env(:homebridge_webhook, :username, "admin")
  defp password, do: Application.get_env(:homebridge_webhook, :password, "admin")
end
