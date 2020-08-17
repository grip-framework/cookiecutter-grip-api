require "grip"

require "./config/**"
require "./{{cookiecutter.project_slug}}/**"
require "./{{cookiecutter.project_slug}}_web/**"

class Application < Grip::Application
  # Export chunks of the code into macros.
  include {{cookiecutter.module_slug}}Web::Helpers::Macros

  # The alias is a shortcut to the longer cumbersome name.
  alias Controllers = {{cookiecutter.module_slug}}Web::Controllers
  alias Views = {{cookiecutter.module_slug}}Web::Views
  alias Pipes = {{cookiecutter.module_slug}}Web::Pipes
  alias Exceptions = Controllers::Exceptions

  # The routing and error handling logic is defined here.
  def initialize

    # Ignore everything other than JSON content.
    pipeline :api, [
      Pipes::AcceptJson.new(),
      Grip::Pipes::Log.new(),
      Grip::Pipes::PoweredByHeader.new()
    ]

    # Insert a big chunk of macro code to register the error code
    # handlers, which return a proper response to the request, if an endpoint fails.
    error 400, Exceptions::BadRequestController
    error 401, Exceptions::UnAuthorizedController
    error 403, Exceptions::ForbiddenController
    error 404, Exceptions::NotFoundController
    error 405, Exceptions::MethodNotAllowedController
    error 500, Exceptions::InternalServerErrorController
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
