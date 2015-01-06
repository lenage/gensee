# Gensee

Gensee is Ruby wrapper for [Gensee API](http://www.gensee.com/document-technical.php),

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gensee'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gensee

## Usage

```ruby
client = Gensee.client('http://yoursubdomain.gensee.com', 'gensee@username', 'yourpassword')
classroom = client.create_classroom('AWESOME CLASSROOM', Time.now, rand(100_000..200_000), rand(100_000..2000_000))
puts classroom[:student_join_url] # http://youdomain.gensee.com/training/site/s/{classroom_number}
puts classroom[:teacher_join_url] # http://youdomain.gensee.com/training/site/s/{classroom_number}
puts classroom[:number] # 34154643
puts classroom[:id] # mquQf2
```

## Testing

    $ export GENSEE=some@email.com:aloooongpassword
    $ rake

## Contributing

1. Fork it ( https://github.com/[my-github-username]/gensee/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
