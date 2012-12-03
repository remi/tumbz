module Tumbz
  class User
    include Model
    include Her::Model
    uses_api Tumbz.api
    custom_get :search

    def self.sign_in!(email, password)
      post_raw("auth", :email => email, :password => password) do |parsed_data|
        Thread.current[:tumbz_access_token] = parsed_data[:data][:access_token]
      end
    end

    def self.sign_out!
      Thread.current[:tumbz_access_token] = nil
      Thread.current[:tumbz_access_token].nil?
    end
  end
end
