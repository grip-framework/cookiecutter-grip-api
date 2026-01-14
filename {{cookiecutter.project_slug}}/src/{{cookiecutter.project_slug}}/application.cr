require "../{{cookiecutter.project_slug}}_web/**"

module {{cookiecutter.module_slug}}
  class Application
    include Grip::Application

    # The alias is a shortcut to the longer cumbersome name.
    alias Controllers = {{cookiecutter.module_slug}}Web::Controllers

    property handlers : Array(HTTP::Handler) = [
      Grip::Handlers::Log.new,
      Grip::Handlers::Exception.new,
      Grip::Handlers::HTTP.new,
    ] of HTTP::Handler

    property environment : String = Constants::ENVIRONMENT
    property host : String = Constants::HOST
    property port : Int32 = Constants::PORT.to_i
    property? reuse_port : Bool = (Constants::REUSE_PORT || "true") == "true" ? true : false

    def initialize
      # All of the initial connections and setup is defined here.
      routes
    end

    def routes
      # The routing logic is defined here.
      scope "/api" do
        scope "/cookie" do
          get "/",  Controllers::CookieController
          post "/", Controllers::CookieController
        end
      end
    end
  end
end
