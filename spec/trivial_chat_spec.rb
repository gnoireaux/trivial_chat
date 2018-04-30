RSpec.describe TrivialChat do
  it 'has a version number' do
    expect(TrivialChat::VERSION).not_to be nil
  end

  it 'has a client' do
    expect(TrivialChatClient).not_to be nil
  end

  context 'When the server is running' do
    before do
      @port = 4242
      @cs = TrivialChatServer.new(@port)
      @cs.start
    end

    after do
      @cs.stop
    end

    def new_connected_client
      TCPSocket.new 'localhost', @port
    end

    it 'accepts 3 (multiple!) connections' do
      3.times do
        expect(new_connected_client).to be_a TCPSocket
      end
    end

    it 'receives messages from a socket and broadcasts them to all clients' do
      a, b, c  = new_connected_client, new_connected_client, new_connected_client
      a.gets; b.gets; c.gets # welcome message from server
      a.puts 'message'
      within 0.1.seconds do
        expect(a.gets).to eq "message\n"
        expect(b.gets).to eq "message\n"
        expect(c.gets).to eq "message\n"
      end
    end

    # it "should handle network failure" do
    # end
  end
end
