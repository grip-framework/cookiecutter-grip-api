module {{cookiecutter.module_slug}}Web
  module Controllers
    class CookieController < Grip::Controllers::Http
      def get(context : Context)
        context
          .put_status(418)
          .text("Hello, World!")
      end

      def post(context : Context)
        message = context.fetch_json_params.["exampleRequest"]

        context
          .put_status(201)
          .text("Bye, #{message}!")
      end
    end
  end
end