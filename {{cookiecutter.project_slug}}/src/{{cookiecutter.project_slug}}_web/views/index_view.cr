module {{cookiecutter.module_slug}}Web
  module Views
    class Index
      def self.one(context)
        {
          "message" => "Hello, #{context.request.method}!",
          "method" => context.request.method
        }
      end
    end
  end
end