module {{cookiecutter.module_slug}}Web
  module Views
    module Exceptions
      class BadRequestView
        def self.render_default(context)
          context.response.headers.merge!({"Content-Type" => "application/json"})
          context.response.print(
            {
              "errors" => [
                context.exception.to_s
              ]
            }.to_json
          )
        end
      end
    end
  end
end