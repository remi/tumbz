module Tumbz
  class Product
    include Her::Model
    uses_api Tumbz.api
    custom_get :search
  end
end
