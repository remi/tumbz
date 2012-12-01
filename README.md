# Tumbz

This gem allows you to easily use the [Tum.bz API](http://tum.bz/api).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tumbz'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tumbz

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
