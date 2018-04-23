RSpec.describe TrivialChat do
  it "has a version number" do
    expect(TrivialChat::VERSION).not_to be nil
  end

  it "accepts 3 (multiple!) connections" do
    port = 4242
    cs = TrivialChatServer.new(port)
    cs.run
    client1 = TCPSocket.new 'localhost', port
    expect(client1).to be_a TCPSocket
    expect(TCPSocket.new 'localhost', port).to be_a TCPSocket
    expect(TCPSocket.new 'localhost', port).to be_a TCPSocket
  end

  # it "receives messages from a socket" do
  # end
  
  # it "broadcasts messages to all clients" do
  # end

  # it "should handle network failure" do
  # end
end
