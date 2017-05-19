defmodule FacebookMessenger.Messaging do
  @moduledoc """
  Facebook messaging structure, contains the sender, recepient and message info
  """
  @derive [Poison.Encoder]
  defstruct [
    :type,
    :sender,
    :recipient,
    :timestamp,
    :message,
    :delivery,
    :read,
    :postback,
    :optin,
    :referral,
    :account_linking,
  ]

  @type t :: %__MODULE__{
    type: String.t,
    sender: FacebookMessenger.User.t,
    recipient: FacebookMessenger.User.t,
    timestamp: integer,
    message: FacebookMessenger.Message.t,
    delivery: FacebookMessenger.Delivery.t,
    read: FacebookMessenger.Read.t,
    postback: FacebookMessenger.Postback.t,
    optin: FacebookMessenger.Optin.t,
    referral: FacebookMessenger.Referral.t,
    account_linking: FacebookMessenger.AccountLinking.t,
  }
end
