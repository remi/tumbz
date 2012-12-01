require "bundler/gem_tasks"
require "tumbz"

task :demo do
  Tumbz.configure do |config|
    config.api_key = "nzaEhGbo4B9yAOn1GKveoSL003sexY9F"
  end

  p Tumbz::User.find("remi")
  #p Tumbz::User.get(:search, :q => "bass")
  #p Tumbz::Product.get(:search, :q => "office", :cat => "tv")
end

task :oauth do
  Tumbz.configure do |config|
    config.api_key = "nzaEhGbo4B9yAOn1GKveoSL003sexY9F"
  end

  #p Tumbz::User.sign_in!("", "",)
  #p Tumbz::User.sign_out!
  #p Tumbz::Review.create(:product_external_id => "tt0458339", :positive => "1", :cat => "movie")
end
