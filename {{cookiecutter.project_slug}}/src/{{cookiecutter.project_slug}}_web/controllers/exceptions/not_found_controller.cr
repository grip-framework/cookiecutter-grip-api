module {{cookiecutter.module_slug}}Web
  module Controllers
    module Exceptions
      class NotFoundController < Grip::Controllers::Exception
        alias NotFoundView = {{cookiecutter.module_slug}}Web::Views::Exceptions::NotFoundView
        def call(context)
          case context.exception.not_nil!
          when Grip::Exceptions::NotFound
            NotFoundView.render_default(context)
          end
        end
      end
    end
  end
end