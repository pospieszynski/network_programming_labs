require 'socket'        # Sockets are in standard library

hostname = 'localhost'
port = 12000



loop {
  begin
    socket = TCPSocket.open(hostname, port)
    puts 'Type message message: '
    name = gets
    socket.puts name
    while line = socket.gets
      puts line
    end
    socket.close
  rescue Exception
    puts 'error'
    break
  end
}
