# Rdayone

Rdayone is a simple Ruby library for accessing Day One journals.

[![Build Status](https://secure.travis-ci.org/simonjefford/rdayone.png)](http://travis-ci.org/simonjefford/rdayone)


## Installation

Add this line to your application's Gemfile:

    gem 'rdayone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rdayone

## Usage

``` ruby
require "rdayone"
journal = Rdayone::Journal.new("/path/to/Journal.dayone")
journal.entries # An Enumerable array like object that contains all your entries
```

## NOTE

This is a *very* early release. Entries currently contain the entry text, date and paths
to related photos only.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
