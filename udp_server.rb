require 'socket'
s = UDPSocket.new

puts 'Provide host(default is 127.0.0.1): '
host = gets

puts 'Provide port(default is 1234): '
port = gets

host = (host.chomp.length == 0 ? '127.0.0.1' : host)
port = (port.chomp.length == 0 ? '1234' : port)

begin
  s.bind(host.chomp, port.chomp.to_i)

  puts ".::Server listening on #{host.chomp}:#{port.chomp}:.."

  loop do
    begin
      text, sender = s.recvfrom(16)
    rescue Exception => e
      puts "Unhabdled error occured"
      puts "Log:"
      p e
    end
    puts text
  end
rescue Exception => e
  puts "Unable to bind socket or othe rerror occured"
  puts e.message
end