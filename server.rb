require 'socket'

begin
  server = TCPServer.open(2000)
  loop do
    Thread.start(server.accept) do |client|
      while line = client.gets
        puts line.chop
      end
      client.close
    end
  end
rescue Interrupt
end
