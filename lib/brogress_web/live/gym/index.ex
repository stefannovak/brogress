defmodule BrogressWeb.Gym.Index do
  use BrogressWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, %{})}
  end
end
