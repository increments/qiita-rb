# Qiita

Ruby wrapper for Qiita API v1.

## Installation

Add this line to your application's Gemfile:

    gem 'qiita'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qiita

## Usage

### Get user's items
```ruby
Qiita.user_items 'yaotti'
```

### Get tag's items
```ruby
Qiita.tag_items 'ruby'
```

### Get a specified item with comments and raw markdown content
```ruby
item_uuid = '1234567890abcdefg'
Qiita.item item_uuid
```


## Authenticated requests

### Login with "username & password" or "token"
```
qiita = Qiita.new url_name: 'yaotti', password: 'mysecret' # => contains token
# or
qiita = Qiita.new token: 'myauthtoken'
```

### Get my items
```ruby
qiita.user_items
```

### Post/Update/Delete an item
```ruby
# post
item = qiita.post_item title: 'Hello', body: 'markdown text', tags: [{ name: 'ruby', versions: %w[1.9.2 1.9.3] }], private: false

# update
qiita.update_item item.uuid, title: 'modified'

# delete
qiita.delete_item item.uuid
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
