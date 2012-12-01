module Tumbz
  module Middleware
    class Auth < Faraday::Middleware
      def initialize(app, options={})
        @app = app
        @options = options
      end

      def call(env)
        env[:request_headers]["Authorization"] = "OAuth #{Tumbz.access_token}" unless Tumbz.access_token.nil?
        @app.call(env)
      end
    end
  end
end
