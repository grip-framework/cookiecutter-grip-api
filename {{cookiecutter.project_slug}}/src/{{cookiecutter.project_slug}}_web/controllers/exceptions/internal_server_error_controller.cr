module {{cookiecutter.module_slug}}Web
  module Controllers
    module Exceptions
      class InternalServerErrorController < Grip::Controllers::Exception
        alias InternalServerErrorView = {{cookiecutter.module_slug}}Web::Views::Exceptions::InternalServerErrorView
        
        def call(context)
          case context.exception.not_nil!
          when ::Exceptions::InternalServerError
            InternalServerErrorView.render_default(context)
          end
        end
      end
    end
  end
end