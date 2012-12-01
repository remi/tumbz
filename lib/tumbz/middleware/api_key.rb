module Tumbz
  module Middleware
    class ApiKey < Faraday::Middleware
      def initialize(app, options={})
        @app = app
        @options = options
      end

      def call(env)
        env[:url].query = env[:url].query ? "#{env[:url].query}&apikey=#{@options[:api_key]}" : "apikey=#{@options[:api_key]}"
        @app.call(env)
      end
    end
  end
end
