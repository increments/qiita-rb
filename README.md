# Qiita
A client library for Qiita API v2 written in Ruby.

## Installation
Note that this library requires Ruby 2.0.0 or higher.

```sh
gem install qiita
```

## Usage
Here is an example usage of this library. See [/doc](/doc) for more details.

```rb
require "qiita"

client = Qiita::Client.new(access_token: ENV["ACCESS_TOKEN"])
response = client.get_user("r7kamura")
response.body #=> {
  "description"         => "",
  "facebook_id"         => "",
  "followers_count"     => 149,
  "followees_count"     => 22,
  "github_login_name"   => "r7kamura",
  "items_count"         => 13,
  "linkedin_id"         => "",
  "location"            => "",
  "name"                => "",
  "organization"        => "Increments Inc.",
  "profile_image_url"   =>  "htps://secure.gravatar.co m/avatar/089127ffb92a19d3d37815673cca06dc?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
  "twitter_screen_name" => "r7kamura",
  "url_name"            => "r7kamura",
  "website_url"         => ""
}
```

## For contributors
There are some useful commands to start development of this library.

```sh
# Set up by installing some softwares to start development.
make setup

# Run all tests.
make test

# Update API docs.
make doc

# Run `test` and `doc`.
make
```
