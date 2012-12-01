module Tumbz
  class PartnerLookup
    include Her::Model
    uses_api Tumbz.api
    custom_get :books, :tvshows
  end
end
