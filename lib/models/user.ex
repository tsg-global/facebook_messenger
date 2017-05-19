defmodule FacebookMessenger.User do
  @moduledoc """
  Facebook user structure
  """

  @derive [Poison.Encoder]
  defstruct [:id]

  @type t :: %__MODULE__{
    id: String.t
  }
end
