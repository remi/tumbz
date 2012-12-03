module Tumbz
  module Middleware
    class Auth < Faraday::Middleware
      def initialize(app, options={})
        @app = app
        @options = options
      end

      def call(env)
        env[:request_headers]["Authorization"] = "OAuth #{Thread.current[:tumbz_access_token]}" unless Thread.current[:tumbz_access_token].nil?
        @app.call(env)
      end
    end
  end
end
