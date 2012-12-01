module Tumbz
  module Model
    def error?
      self.errors.any?
    end
  end
end
