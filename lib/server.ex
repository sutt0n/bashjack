defmodule Server do
  @default_server_port 7331
  @local_host {127, 0, 0, 1}
  def launch_server do
    port = @default_server_port
    IO.puts("Launching server on localhost on port #{port}")
    server = Socket.UDP.open!(port)
    serve(server)
  end

  def serve(server) do
    {data, client} = server |> Socket.Datagram.recv!()
    IO.puts("Received: #{data}, from #{inspect(client)}")

    serve(server)
  end
end
