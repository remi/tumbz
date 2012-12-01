module Tumbz
  class UserSuggestion
    include Model
    include Her::Model
    uses_api Tumbz.api
  end
end
