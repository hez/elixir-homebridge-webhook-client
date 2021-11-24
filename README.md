# Homebridge Webhook plugin Client

HTTP Client for the Homebridge (HTTP Webhooks plugin)[https://github.com/benzman81/homebridge-http-webhooks]

## Supported Inputs

- Stateless Switch

## Installation

The package can be installed by adding `homebridge_webhook` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:homebridge_webhook, github: "hez/elixir-homebridge-webhook-client", tag: "v0.1.4"}
  ]
end
```

## Configuration

Add Homebridge server host configuration to your config/* file.

```
config :homebridge_webhook,
  base_url: "http://homebridge.local:51828",
  username: "admin",
  password: "admin"
```
