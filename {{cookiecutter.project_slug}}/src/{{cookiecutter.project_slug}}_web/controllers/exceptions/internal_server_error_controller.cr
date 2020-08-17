module {{cookiecutter.module_slug}}Web
  module Controllers
    module Exceptions
      class InternalServerErrorController < Grip::Controllers::Exception
        def call(context); end
        # The exception in this case can be used to identify the cause of the exceptions
        # and match over it, which will provide better details about the endpoint itself.
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