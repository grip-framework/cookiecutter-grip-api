module {{cookiecutter.module_slug}}Web
  module Controllers
    module Exceptions
      class UnauthorizedController < Grip::Controllers::Exception
        alias UnauthorizedView = {{cookiecutter.module_slug}}Web::Views::Exceptions::UnauthorizedView
        def call(context)
          case context.exception.not_nil!
          when Grip::Exceptions::Unauthorized
            UnauthorizedView.render_default(context)
          end
        end
      end
    end
  end
end