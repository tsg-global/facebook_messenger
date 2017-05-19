defmodule FacebookMessenger.Delivery do
  @moduledoc """
  Facebook entry structure
  """
  @derive [Poison.Encoder]
  defstruct [
    :mids,
    :watermark,
    :seq,
  ]

  @type t :: %__MODULE__{
    mids: [String.t],
    watermark: String.t,
    seq: integer
  }
end
