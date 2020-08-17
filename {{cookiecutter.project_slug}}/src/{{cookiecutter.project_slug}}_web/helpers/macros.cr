module {{cookiecutter.module_slug}}Web
  module Helpers
    module Macros
      macro register_exception_handlers()
        error 400, do |context|
          Views::FallbackView.render(context, "Bad request, please try again in a few minutes!", 400)
        end
    
        error 401, do |context|
          Views::FallbackView.render(context, "Unauthorized, you do not have the rights to access this endpoint!", 401)
        end
    
        error 403, do |context|
          Views::FallbackView.render(context, "Forbidden, you do not have the privilege to access this endpoint!", 403)
        end
    
        error 404, do |context|
          Views::FallbackView.render(context, "Not found, please try a route that actually exists!", 404)
        end
    
        error 405, do |context|
          Views::FallbackView.render(context, "Method not allowed, please try again with a different HTTP method!", 405)
        end
    
        error 500, do |context|
          unless APP_ENV == "development"
            Views::FallbackView.render(context, "Not found, please try a route that actually exists!", 404)
          else
            Views::FallbackView.render(context, "Internal server error, please try again later.", 500)
          end
        end
      end
    end
  end
end