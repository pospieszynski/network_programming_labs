require 'socket'                 # Get sockets from stdlib


server = TCPServer.open(12000)    # Socket to listen on port 2000

loop {                           # Servers run forever
  Thread.fork(server.accept) do |client|
    message =  client.gets
    client.puts("Echo message: #{message}")
    puts message
    client.close                  # Disconnect from the client
  end
}
