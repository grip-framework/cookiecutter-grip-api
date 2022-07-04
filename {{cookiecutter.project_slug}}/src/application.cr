require "grip"

require "./{{cookiecutter.project_slug}}/**"
require "./{{cookiecutter.project_slug}}_web/**"

class Application < Grip::Application
  # The alias is a shortcut to the longer cumbersome name.
  alias Controllers = {{cookiecutter.module_slug}}Web::Controllers

  def reuse_port
    true
  end

  # The routing and error handling logic is defined here.
  def routes
    scope "/api" do
      scope "/cookie" do
        get "/",  Controllers::CookieController
        post "/", Controllers::CookieController
      end
    end
  end
end
