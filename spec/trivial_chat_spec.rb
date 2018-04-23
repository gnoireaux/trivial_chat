RSpec.describe TrivialChat do
  it 'has a version number' do
    expect(TrivialChat::VERSION).not_to be nil
  end

  context 'The server is running.' do
    before do
      @port = 4242
      @cs = TrivialChatServer.new(@port)
      @cs.run
    end

    after do
      @cs.stop
    end

    def new_client
      TCPSocket.new 'localhost', @port
    end

    it 'accepts 3 (multiple!) connections' do
      3.times do
        expect(new_client).to be_a TCPSocket
      end
    end

    it 'receives messages from a socket' do
      new_client.write 'message'
    end

    # it "broadcasts messages to all clients" do
    # end

    # it "should handle network failure" do
    # end
  end
end
