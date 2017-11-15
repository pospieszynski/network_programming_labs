require 'socket'

s = UDPSocket.new

puts 'Provide host(default is 127.0.0.1): '
host = gets

puts 'Provide port(default is 1234): '
port = gets

host = (host.chomp.length == 0 ? '127.0.0.1' : host)
port = (port.chomp.length == 0 ? '1234' : port)

loop do
  puts 'Message to be sent: '
  message = gets

  begin
    if(s.send(message.chomp, 0, host.chomp, port.chomp) == 0)
      raise Exception.new('0 characters send to receiver. Make sure the setup is correct')
    end
  rescue Exception => e
    puts e.message
  end
end
