module {{cookiecutter.module_slug}}Web
  module Pipes
    class AcceptJson < Grip::Pipe::Base
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