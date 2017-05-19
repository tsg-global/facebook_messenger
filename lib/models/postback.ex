defmodule FacebookMessenger.Postback do
  @moduledoc """
  Facebook postback structure

  https://developers.facebook.com/docs/messenger-platform/webhook-reference/postback
  """

  @derive [Poison.Encoder]
  defstruct [:payload, :referral]

  @type t :: %__MODULE__{
    payload: String.t,
    referral: FacebookMessenger.Referral.t,
  }
end
