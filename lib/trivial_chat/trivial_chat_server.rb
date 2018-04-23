# A trivial chat server
class TrivialChatServer
  def initialize(port)
    @port = port
    @server_socket = TCPServer.new port
    @thread_accept = nil
    @clients = []
  end

  def run
    @thread_accept = Thread.new do
      loop do
        if ready = IO.select([@server_socket, @clients].flatten!) then
          ready.first.each do |ready_for_reading|
            if ready_for_reading == @server_socket then
              new_client
            else
              msg = ready_for_reading.gets
              @clients.each do |client|
                client.puts msg
              end
            end
          end
        end
      end
    end
  end

  def new_client
    nc = @server_socket.accept
    @clients << nc
    nc.puts 'Connected to server' 
  end

  def stop
    @thread_accept.terminate
    @server_socket.close
  end
end
