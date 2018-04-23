RSpec.describe TrivialChat do
  it "has a version number" do
    expect(TrivialChat::VERSION).not_to be nil
  end

  context "The server is running." do 
    before do
      @port = 4242
      @cs = TrivialChatServer.new(@port)
      @cs.run
    end

    it "accepts 3 (multiple!) connections" do
      client1 = TCPSocket.new 'localhost', @port
      expect(client1).to be_a TCPSocket
      expect(TCPSocket.new 'localhost', @port).to be_a TCPSocket
      expect(TCPSocket.new 'localhost', @port).to be_a TCPSocket
    end

    # it "receives messages from a socket" do
    # end

    # it "broadcasts messages to all clients" do
    # end

    # it "should handle network failure" do
    # end
  end
end
