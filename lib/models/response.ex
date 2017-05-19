defmodule FacebookMessenger.Response do
  @moduledoc """
  Facebook messenger response structure
  """

  @derive [Poison.Encoder]
  @postback_regex ~r/postback/
  defstruct [:object, :entry]

  @doc """
  Decode a map into a `FacebookMessenger.Response`
  """
  @spec parse(map) :: FacebookMessenger.Response.t

  def parse(param) when is_map(param) do
    decoder = param |> get_parser |> decoding_map
    Poison.Decode.decode(param, as: decoder)
  end

  @doc """
  Decode a string into a `FacebookMessenger.Response`
  """
  @spec parse(String.t) :: FacebookMessenger.Response.t
  def parse(param) when is_binary(param) do
    decoder = param |> get_parser |> decoding_map
    Poison.decode!(param, as: decoder)
  end

  @doc """
  Get shorter representation of message data
  """
  @spec get_messaging(FacebookMessenger.Response.t) :: FacebookMessenger.Messaging.t
  def get_messaging(%{entry: entries}) do
    entries |> hd |> Map.get(:messaging) |> hd
  end

  @doc """
  Return an list of message texts from a `FacebookMessenger.Response`
  """
  @spec message_texts(FacebookMessenger.Response) :: [String.t]
  def message_texts(%{entry: entries}) do
    messaging =
      entries
      |> get_messaging_struct
      |> Enum.map(&( &1 |> Map.get(:message)
      |> Map.get(:text)))
  end

  @doc """
  Return an list of message sender Ids from a `FacebookMessenger.Response`
  """
  @spec message_senders(FacebookMessenger.Response) :: [String.t]
  def message_senders(%{entry: entries}) do
    entries
    |> get_messaging_struct
    |> Enum.map(&( &1 |> Map.get(:sender) |> Map.get(:id)))
  end

  @doc """
  Return user defined postback payload from a `FacebookMessenger.Response`
  """
  @spec get_postback(FacebookMessenger.Response) :: FacebookMessenger.Postback.t
  def get_postback(%{entry: entries}) do
    entries
    |> get_messaging_struct
    |> Enum.map(&Map.get(&1, :postback))
    |> hd
  end

  defp get_parser(param) when is_binary(param) do
    cond do
      String.match?(param, @postback_regex) -> postback_parser
      true -> text_message_parser
    end
  end

  defp get_parser(%{"entry" => entries} = param) when is_map(param) do
    messaging = entries |> get_messaging_struct("messaging") |> hd

    cond do
      Map.has_key?(messaging, "postback") -> postback_parser
      Map.has_key?(messaging, "message") -> text_message_parser
    end
  end

  defp get_messaging_struct(entries, messaging_key \\ :messaging) do
    Enum.flat_map(entries, &Map.get(&1, messaging_key))
  end

  defp postback_parser do
    %FacebookMessenger.Messaging{
      "type": "postback",
      "sender": %FacebookMessenger.User{},
      "recipient": %FacebookMessenger.User{},
      "postback": %FacebookMessenger.Postback{}
    }
  end

  defp text_message_parser do
    %FacebookMessenger.Messaging{
      "type": "message",
      "sender": %FacebookMessenger.User{},
      "recipient": %FacebookMessenger.User{},
      "message": %FacebookMessenger.Message{}
    }
  end

  defp decoding_map(messaging_parser) do
    %FacebookMessenger.Response{
      "entry": [%FacebookMessenger.Entry{
        "messaging": [messaging_parser]
      }]}
  end

   @type t :: %__MODULE__{
    object: String.t,
    entry: FacebookMessenger.Entry.t
  }
end
