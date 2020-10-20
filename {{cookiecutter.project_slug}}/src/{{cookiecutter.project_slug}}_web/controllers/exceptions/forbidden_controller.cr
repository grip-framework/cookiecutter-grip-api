module {{cookiecutter.module_slug}}Web
  module Controllers
    module Exceptions
      class ForbiddenController < Grip::Controllers::Exception
        alias ForbiddenView = {{cookiecutter.module_slug}}Web::Views::Exceptions::ForbiddenView
        
        def call(context)
          case context.exception.not_nil!
          when ::Exceptions::Forbidden
            ForbiddenView.render_default(context)
          end
        end
      end
    end
  end
end