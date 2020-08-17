module {{cookiecutter.module_slug}}Web
  module Pipes
    # `{{cookiecutter.module_slug}}Web::Pipes::AcceptJson` defines a pipe which
    # accepts requests with a `Content-Type` of `application/json` and
    # rejects every other request which don't meet the requirements.
    class AcceptJson < Grip::Pipes::Base
      def call(context)
        if content_type = context.request.headers["Content-Type"]?
          if content_type != "application/json"
            raise Grip::Exceptions::BadRequest.new(context)
          end
        else
          raise Grip::Exceptions::BadRequest.new(context)
        end
      end
    end
  end
end