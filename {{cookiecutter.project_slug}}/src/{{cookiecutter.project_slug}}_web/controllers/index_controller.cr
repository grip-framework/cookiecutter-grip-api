module {{cookiecutter.module_slug}}Web
  module Controllers
    class Index < Grip::Controller::Http
      alias Render = {{cookiecutter.module_slug}}Web::Views::Index

      def get(context)
        json(
          context,
          Render.one(context)
        )
      end

      def post(context)
        json(
          context,
          Render.one(context)
        )
      end

      def put(context)
        json(
          context,
          Render.one(context)
        )
      end

      def delete(context)
        json(
          context,
          Render.one(context)
        )
      end
    end
  end
end