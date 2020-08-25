defmodule Client do
  def send_data(data, host, port) do
    server = Socket.UDP.open!()
    Socket.Datagram.send!(server, data, {host, port})
  end

  @spec send_data(binary, tuple) :: :ok
  def send_data(data, addr) do
    server = Socket.UDP.open!()
    Socket.Datagram.send!(server, data, addr)
  end

  @spec get_addr(binary) :: tuple
  def get_addr(address) do
    address = address |> String.split(":") |> hd |> String.split(".")
    address = for octet <- address, do: octet |> String.to_integer()
    address |> List.to_tuple()
  end

  @spec get_port(binary()) :: integer()
  def get_port(address), do: address |> String.split(":") |> tl |> hd |> String.to_integer()
end
