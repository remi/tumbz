# Tumbz

This gem allows you to easily use the [Tum.bz API](http://tum.bz/api). It’s powered by [Her](https://github.com/remiprev/her).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tumbz', :git => "git://github.com/remiprev/tumbz.git", :branch => "master"
```

And then execute:

    $ bundle

## Usage

First, you must define a `configure` block with your API key:

```ruby
Tumbz.configure do |config|
  config.api_key = "nzaEhGbo4B9yAOn1GKveoSL003sexY9F"
end
```

That’s it! You’ll then be able to use :

```ruby
Tumbz::User.find("remi")
# => #<Tumbz::User(users/4f0e32936edcb2000100029d) id="4f0e32936edcb2000100029d" username="remi" profile_url="http://tum.bz/u/remi" firstname="Rémi" lastname="Prévost"…>

Tumbz::Product.search(:q => "office", :cat => "tv")
# => [#<Tumbz::Product(products/50b4caaac042690002010e1c) id="50b4caaac042690002010e1c" cat="tv" url="http://tum.bz/tv/50b4caaac042690002010e1c/the-offic..." title="The Office (US)" artist=nil external_id="73244" img_thumb=nil img_cover=""…>]
```

Other modules are:

* `Tumbz::Comment`
* `Tumbz::Like`
* `Tumbz::Review`
* `Tumbz::PartnerLookup`
* `Tumbz::Product`
* `Tumbz::User`
* `Tumbz::UserSuggestion`

The API wrapper is powered by [Her](https://github.com/remiprev/her), so most of [its documentation](https://github.com/remiprev/her) will be helpful.

## OAuth

Support for OAuth-authenticated calls is supported, but very premitive (not quite thread-safe). Here’s how it works:

```ruby
Tumbz::User.sign_in!("<email>", "<password>")
# => "abc123edgfh" (next calls will be made as the authenticated user using this key)

review = Tumbz::Review.create(:product_external_id => "tt0458339", :positive => "1", :cat => "movie")
# => #<Tumbz::Review(reviews/50b9ebd7a9d29c000200af7c) id="50b9ebd7a9d29c000200af7c" positive=true text=""…>

Tumbz::User.sign_out!
# => true (next calls will be made anonymously)

review = Tumbz::Review.create(:product_external_id => "tt0458339", :positive => "1", :cat => "movie")
# => #<Tumbz::Review(reviews)>
review.errors
# => ["Token is invalid or expired"]
```

You don’t need to use `User.sign_in!` each time, you can also set the `access_token` manually (eg. if you store it in a session):

```ruby
Tumbz.access_token = "abc123edgfh"
review = Tumbz::Review.create(:product_external_id => "tt0458339", :positive => "1", :cat => "movie")
# => #<Tumbz::Review(reviews/50b9ebd7a9d29c000200af7c) id="50b9ebd7a9d29c000200af7c" positive=true text=""…>
```

### OAuth in a Web application

Since each request will probably have a different user (and a different `access_token`) it’s better to use some kind of filter to make sure each request gets its own user only. For example, with Ruby on Rails:

```ruby
class ApplicationController < ActionController::Base
  around_filter :do_with_tumbz_user

  def do_with_tumbz_user
    Tumbz::User.sign_in!("<email>", "<password>")
    # or Tumbz::User.set_access_token!("<access_token>")

    begin
      yield
    ensure
      Tumbz::User.sign_out!
    end
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
