# Sankalan

This gem is an attempt to make calls to dtrace and mdb interchangeably without using multiple tabs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sankalan'
```

And then execute:

    ```ruby
    $ bundle
    ```

Or install it yourself as:

    ```ruby
    $ gem install sankalan
    ```

For testing and development, follow the instructions in the development section, simply clone this code, and run bin/console after running bundle install.


## Usage

- Creating the sankalan object . 
```ruby
s = Sankalan::Sankalan.new
```

- Getting the process object from the variable, 
```ruby
p = s.find_method "pulseaudio"
```

- Calling dtrace on it. 
```ruby
p.dtrace "","","","",true
```
The fifth parameter would stop the process if required, when the probe is hit. It is default to false

- Testing permission
```ruby
s.test
```
It would quit if you don't have adequate permissions.

- Pausing and running the processes
```ruby
p.pause
p.restart
```
- Walk a process
```ruby
p.walk
```
It would display all the required methods in a process

- File object of a  process
```ruby
f = p.find_file
f.walk
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/prashantbarca/sankalan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

