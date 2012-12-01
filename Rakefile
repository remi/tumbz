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
