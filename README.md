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
```

Other modules are:

* `Tumbz::Comment`
* `Tumbz::Like`
* `Tumbz::Review`
* `Tumbz::PartnerLookup`
* `Tumbz::Product`
* `Tumbz::User`

The API wrapper is powered by [Her](https://github.com/remiprev/her), so most of [its documentation](https://github.com/remiprev/her) will be helpful.

## OAuth

Support for OAuth-authenticated calls is supported, but very premitive (not quite thread-safe). Here’s how it works:

```ruby
Tumbz::User.sign_in!("<email>", "<password>")
# => true (next calls will be made as the authenticated user)

review = Tumbz::Review.create(:product_external_id => "tt0458339", :positive => "1", :cat => "movie")
# => #<Tumbz::Review(reviews/50b9ebd7a9d29c000200af7c) id="50b9ebd7a9d29c000200af7c" positive=true text=""…>

Tumbz::User.sign_out!
# => true (next calls will be made anonymously)

review = Tumbz::Review.create(:product_external_id => "tt0458339", :positive => "1", :cat => "movie")
# => #<Tumbz::Review(reviews)>
review.errors
# => ["Token is invalid or expired"]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
