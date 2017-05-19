defmodule FacebookMessenger.AccountLinking do
  @moduledoc """
  Contains AccountLinking information

  https://developers.facebook.com/docs/messenger-platform/webhook-reference/account-linking
  """
  @derive [Poison.Encoder]
  defstruct [
    :status,
    :authorization_code,
  ]

  @type t :: %__MODULE__{
    status: String.t,
    authorization_code: String.t,
  }
end
