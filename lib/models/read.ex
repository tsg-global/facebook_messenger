defmodule FacebookMessenger.Read do
  @moduledoc """
  Facebook entry structure
  """
  @derive [Poison.Encoder]
  defstruct [
    :watermark,
    :seq,
  ]

  @type t :: %__MODULE__{
    watermark: String.t,
    seq: integer,
  }
end
