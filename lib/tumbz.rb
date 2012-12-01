# Dependencies
require "bundler"
Bundler.require

# Modules
require "tumbz/version"
require "tumbz/model"
require "tumbz/config"
require "tumbz/middleware/parse"
require "tumbz/middleware/api_key"
require "tumbz/middleware/auth"

module Tumbz
  def self.api
    @api
  end

  def self.access_token=(token)
    @access_token = token
  end

  def self.access_token
    @access_token
  end

  def self.configure(&blk)
    options = OpenStruct.new
    yield(options)

    @api = Her::API.new
    @api.setup :url => "http://api.tum.bz/v1/" do |connection|
      connection.use Tumbz::Middleware::ApiKey, :api_key => options.api_key
      connection.use Tumbz::Middleware::Auth
      connection.use Faraday::Request::UrlEncoded
      connection.use Tumbz::Middleware::Parse
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
