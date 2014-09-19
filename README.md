# Qiita
A client library for Qiita API v2 written in Ruby.

## Installation
```sh
gem install qiita
```

## Usage
```rb
client = Qiita::Client.new(access_token: ENV["ACCESS_TOKEN"])
response = client.get("/api/v2/items", page: 2)
response.body #=> [{...}, {...}, ...]
```

## Requirements
Requires Ruby 2.0.0 or higher version.
