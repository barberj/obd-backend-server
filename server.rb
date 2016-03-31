require 'socket'
require 'remote_syslog_logger'

$logger = RemoteSyslogLogger.new('logs4.papertrailapp.com', 54460)
$logger.formatter = proc do |severity, datetime, progname, msg|
  "#{severity} #{msg}"
end

begin
  server = TCPServer.open(2000)
  loop do
    Thread.start(server.accept) do |client|
      while line = client.gets
        $logger.info(line.chop)
      end
      client.close
    end
  end
rescue Interrupt
  $logger.info("Goodbye!")
end
