defmodule FacebookMessenger.Entry do
  @moduledoc """
  Facebook entry structure
  """
  @derive [Poison.Encoder]
  defstruct [
    :id,
    :changed_fields,
    :changes,
    :time,
    :messaging
  ]

  @type t :: %__MODULE__{
    id: String.t,
    changed_fields: [String.t],
    changes: [map],
    time: integer,
    messaging: FacebookMessenger.Messaging.t,
  }
end
