# Dependencies
require "her"

# Modules
require "tumbz/version"
require "tumbz/config"
require "tumbz/middleware/api_key"

module Tumbz
  def self.api
    @api
  end

  def self.configure(&blk)
    options = OpenStruct.new
    yield(options)

    @api = Her::API.new
    @api.setup :url => "http://api.tum.bz/v1/" do |connection|
      connection.use Tumbz::Middleware::ApiKey, :api_key => options.api_key
      connection.use Faraday::Request::UrlEncoded
      connection.use Her::Middleware::DefaultParseJSON
      connection.use Faraday::Adapter::NetHttp
    end

    require "tumbz/comment"
    require "tumbz/like"
    require "tumbz/review"
    require "tumbz/partner_lookup"
    require "tumbz/product"
    require "tumbz/user"
  end
end
