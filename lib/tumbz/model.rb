module Tumbz
  module Model
    def error?
      self.respond_to?(:error) and !self.error.nil? and self.error != ""
    end
  end
end
