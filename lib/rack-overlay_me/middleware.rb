module Rack
  module OverlayMe
    class Middleware
      def initialize(app)
        @app = app
      end

      def call(env)
        if env['PATH_INFO'] == '/overlay_me.js'
          [200, {"Content-Type" => 'text/javascript'}, File.read(File.expand_path('../../../javascripts/overlay_me.js',__FILE__))]
        else
          status, headers, body = @app.call(env)
          new_body = []
          body.each do |body_part|
            new_body << body_part.gsub('</body>', "<script type=\"text/javascript\" src=\"/overlay_me.js\"></script></body>")
          end
          [status, headers, new_body]
        end
      end
    end
  end
end