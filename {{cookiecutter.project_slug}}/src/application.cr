require "grip"
require "./{{cookiecutter.project_slug}}/**"
require "./{{cookiecutter.project_slug}}_web/**"

class Application < Grip::Application
  # The routing and error handling logic is defined here.
  def initialize; end
end

# Initialize the `Application` to host the API.
app = Application.new()

# For each CPU on the system run the `Application`, reuse the TCP port
# and `sleep()` indefinitely until the process terminates.
System.cpu_count.times do |_|
  Process.fork do
    app.run do |config|
      server = config.server.not_nil!
      server.bind_tcp "0.0.0.0", 4000, reuse_port: true
    end
  end
end

sleep()