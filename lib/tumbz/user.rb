module Tumbz
  class User
    include Her::Model
    uses_api Tumbz.api

    def self.sign_in!(email, password)
      post_raw("auth", :email => email, :password => password) do |parsed_data|
        Tumbz.access_token = parsed_data[:data][:access_token]
      end

      Tumbz.access_token.nil? ? false : true
    end

    def self.sign_out!
      Tumbz.access_token = nil
    end
  end
end
