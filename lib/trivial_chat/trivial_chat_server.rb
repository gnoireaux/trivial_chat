class TrivialChatServer
  def initialize(port)
    @port = port
    @server_socket = TCPServer.new port
    @thread_accept = nil
  end

  def run
    @thread_accept = Thread.new do
      loop do
        @server_socket.accept_nonblock(exception: false)
        sleep 0.01
      end
    end
  end

  def stop
    @thread_accept.terminate
    @server_socket.close
  end
end