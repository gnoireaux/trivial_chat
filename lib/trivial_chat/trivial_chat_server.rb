class TrivialChatServer
  def initialize(port)
    @port = port
    @serverSocket = TCPServer.new port
  end

  def run
    Thread.new do
      loop do
        @serverSocket.accept_nonblock(exception: false)
        sleep 0.01
      end
    end
  end
end