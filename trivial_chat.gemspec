
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "trivial_chat/version"

Gem::Specification.new do |spec|
  spec.name          = "trivial_chat"
  spec.version       = TrivialChat::VERSION
  spec.authors       = ["Guillaume Noireaux"]
  spec.email         = ["gnoireaux@gmail.com"]

  spec.summary       = %q{The goal of this exercise is to create a dead simple "chat" system.}
  spec.description   = %q{This system must be built in two parts:

    Server: Receiving messages from a network interface (any kind) and forwarding them to all the connected clients
    Client: A process reading a string on STDIN and forwarding it to the server, and also receiving messages from the same server and writing them to STDOUT.}
    
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
