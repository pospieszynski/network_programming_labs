require 'socket'

server = TCPServer.open(12000)

loop {
  Thread.fork(server.accept) do |client|
    message = client.gets
    client.puts("Echo message: #{message}")
    puts message
    client.close
  end
}
