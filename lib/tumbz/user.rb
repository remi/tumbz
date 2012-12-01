module Tumbz
  class User
    include Her::Model
    uses_api Tumbz.api
  end
end
