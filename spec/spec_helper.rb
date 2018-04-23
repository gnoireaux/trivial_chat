require "bundler/setup"
require "trivial_chat"
require 'timeout'
module Sleepy

  def within seconds=1, &block
    Timeout.timeout(seconds) do |timeout_length|
      until @result
        @result = yield
        sleep(0.5)
      end
      @result
    end
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include(Sleepy)
  class Integer
    def seconds; self end
  end

  class Float
    def seconds; self end
  end
end
