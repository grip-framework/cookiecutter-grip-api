module {{cookiecutter.module_slug}}Web
  module Controllers
    module Exceptions
      class MethodNotAllowedController < Grip::Controllers::Exception
        alias MethodNotAllowedView = {{cookiecutter.module_slug}}Web::Views::Exceptions::MethodNotAllowedView

        def call(context)
          case context.exception.not_nil!
          when Grip::Exceptions::MethodNotAllowed
            MethodNotAllowedView.render_default(context)
          end
        end
      end
    end
  end
end