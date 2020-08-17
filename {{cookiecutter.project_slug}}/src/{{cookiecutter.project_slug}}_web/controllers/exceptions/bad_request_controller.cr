module {{cookiecutter.module_slug}}Web
  module Controllers
    module Exceptions
      class BadRequestController < Grip::Controllers::Exception
        def call(context); end
        def call(context, exception, status_code)
          json!(
            context,
            {
              "errors" => [exception.to_s]
            },
            status_code
          )
        end
      end
    end
  end
end