defmodule FacebookMessenger.Referral do
  @moduledoc """
    Facebook referral structure
  """

  @derive [Poison.Encoder]
  defstruct [
    :ref,
    :ad_id,
    :source,
    :type
  ]

  @type t :: %__MODULE__{
    ref: String.t,
    ad_id: String.t,
    source: String.t,
    type: String.t
  }
end
