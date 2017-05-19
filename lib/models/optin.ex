defmodule FacebookMessenger.Optin do
  @moduledoc """
  Facebook Opt-in format

  https://developers.facebook.com/docs/messenger-platform/webhook-reference/optins
  """
  @derive [Poison.Encoder]
  defstruct [:ref]

  @type t :: %__MODULE__{
    ref: String.t
  }
end
