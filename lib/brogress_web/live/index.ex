defmodule BrogressWeb.Index do
  use BrogressWeb, :live_view

  @impl true
  def mount(_params, session, socket) do
    user_token = session["user_token"] 
    {:ok, assign(socket, user: user_token)}
  end
end
