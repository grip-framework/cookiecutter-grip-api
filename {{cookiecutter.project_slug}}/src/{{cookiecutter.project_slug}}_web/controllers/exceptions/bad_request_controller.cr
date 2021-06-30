module {{cookiecutter.module_slug}}Web
  module Controllers
    module Exceptions
      class BadRequestController < Grip::Controllers::Exception
        alias BadRequestView = {{cookiecutter.module_slug}}Web::Views::Exceptions::BadRequestView

        def call(context)
          case context.exception.not_nil!
          when Grip::Exceptions::BadRequest
            BadRequestView.render_default(context)
          end
        end
      end
    end
  end
end