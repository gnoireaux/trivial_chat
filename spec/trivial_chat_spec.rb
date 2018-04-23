RSpec.describe TrivialChat do
  it "has a version number" do
    expect(TrivialChat::VERSION).not_to be nil
  end

  it "accepts 3 (multiple!) connections" do
    TCPSocket.new 'localhost', TrivialChatServer.port
  end

  # it "receives messages from a socket" do
  # end
  
  # it "broadcasts messages to all clients" do
  # end

  # it "should handle network failure" do
  # end
end
