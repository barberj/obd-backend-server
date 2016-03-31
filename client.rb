require 'socket'      # Sockets are in standard library

def connect
  hostname = 'localhost'
  port = 2000
  s = TCPSocket.open(hostname, port)

  s.puts(Time.now.ctime)
  s.puts "Closing the connection. Bye!"
  s.close
end
