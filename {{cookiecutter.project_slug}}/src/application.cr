require "grip"
require "./{{cookiecutter.project_slug}}/**"
require "./{{cookiecutter.project_slug}}_web/**"

class Application < Grip::Application
  # The alias is a shortcut to the longer cumbersome name.
  alias Controllers = {{cookiecutter.module_slug}}Web::Controllers

  # The routing and error handling logic is defined here.
  def initialize
    # Ignore everything other than JSON content.
    pipeline :api, [
      {{cookiecutter.module_slug}}Web::Pipes::AcceptJson.new()
    ]
  end
end

# Initialize the `Application` to host the API.
app = Application.new()

# For each CPU on the system run the `Application`, reuse the TCP port.
System.cpu_count.times do |_|
  Process.fork do
    app.run do |config|
      server = config.server.not_nil!
      server.bind_tcp "0.0.0.0", 4000, reuse_port: true
    end
  end
end

# Sleep indefinitely until the process terminates.
sleep()