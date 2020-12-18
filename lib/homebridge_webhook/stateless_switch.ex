defmodule HomebridgeWebhook.StatelessSwitch do
  @moduledoc """
  HTTP Client for the Homebridge HTTP Webhooks (Stateless Switch)[https://github.com/benzman81/homebridge-http-webhooks#stateless-switch].

  ## Examples

  ```
  # Using a stored button client config
  iex> button = HomebridgeWebhook.StatelessSwitch.new("switchid", "Button Name")
  %Tesla.Client{....}
  iex> HomebridgeWebhook.StatelessSwitch.single_press(button)
  {:ok, %Tesla.Env{ ....  body: %{"success" => true} ...}
  ```

  ```
  # One off usage
  iex> HomebridgeWebhook.StatelessSwitch.perform("switchid", "Button Name", :double_press)
  {:ok, %Tesla.Env{ ....  body: %{"success" => true} ...}
  ```
  """

  @single_press 0
  @double_press 1
  @long_press 2

  @type event :: :single_press | :double_press | :long_press

  @spec new(String.t(), String.t()) :: HomebridgeWebhook.client()
  def new(accessory_id, button_name) do
    middleware = [{Tesla.Middleware.Query, [accessoryId: accessory_id, buttonName: button_name]}]
    HomebridgeWebhook.client(middleware)
  end

  @spec press(HomebridgeWebhook.client(), event()) :: HomebridgeWebhook.result()
  def press(client, event), do: perform(client, event)

  @spec single_press(HomebridgeWebhook.client()) :: HomebridgeWebhook.result()
  def single_press(client), do: press(client, :single_press)

  @spec double_press(HomebridgeWebhook.client()) :: HomebridgeWebhook.result()
  def double_press(client), do: press(client, :double_press)

  @spec long_press(HomebridgeWebhook.client()) :: HomebridgeWebhook.result()
  def long_press(client), do: press(client, :long_press)

  @spec perform(String.t(), String.t(), event()) :: HomebridgeWebhook.result()
  def perform(accessory_id, button_name, event) do
    accessory_id
    |> new(button_name)
    |> perform(event)
  end

  @spec perform(HomebridgeWebhook.client(), event()) :: HomebridgeWebhook.result()
  def perform(%Tesla.Client{} = client, event),
    do: HomebridgeWebhook.get(client, event: get_event(event))

  @spec get_event(event()) :: integer()
  defp get_event(:single_press), do: @single_press
  defp get_event(:double_press), do: @double_press
  defp get_event(:long_press), do: @long_press
end
