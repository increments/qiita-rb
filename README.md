# Qiita [![Build Status](https://travis-ci.org/increments/qiita-rb.svg?branch=master)](https://travis-ci.org/increments/qiita-rb)
Qiita API v2 client library and CLI tool, written in Ruby.

### Install
Note: requires Ruby 2.0.0 or higher.

```sh
gem install qiita
```

## Library
See [/doc](/doc) for more details.

```rb
require "qiita"

client = Qiita::Client.new(access_token: "1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcd")
client.list_items
client.list_users
client.get_user_items("r7kamura")
client.get_user("r7kamura")
client.get_user("r7kamura").status
client.get_user("r7kamura").headers
client.get_user("r7kamura").body
```

## CLI
`qiita` executable calls `Qiita::Client`'s methods.

```
$ qiita <method> <arguments> [headers|params] [options]
           |          |          |      |         |
           |          |          |      |         `-- -H, --host
           |          |          |      |             -a, --access-token
           |          |          |      |             -c, --color
           |          |          |      |             -h, --help
           |          |          |      |                 --header
           |          |          |      |                 --no-body
           |          |          |      |             -t, --team
           |          |          |      |
           |          |          |      `------------ key=value or key:=value
           |          |          |
           |          |          `------------------- Key:value
           |          |
           |          `------------------------------ required arguments for the method
           |
           `----------------------------------------- method name

$ qiita list_users
$ qiita get_user r7kamura
$ qiita list_user_items r7kamura
```

### Method and Arguments
Pass [Qiita::Client's method name](doc/client.md) and required arguments.

### Access token
Accepts access token via `-a, --access-token` or `QIITA_ACCESS_TOKEN` environment variable.

### Headers
To set custom request headers, use `Key:value` syntax.

```
$ qiita list_items "Authorization:Bearer 1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcd"
```

### Params
Params are used for query string in GET method, or for request body in other methods.
You can set params by `key=value` or `key:=value` syntax.
`key=value` is parsed into String value,
while `key:=value` is parsed into JSON value (e.g. key:=17 will be `{"key":17}`).
`qiita` also accepts params via STDIN.

```
$ qiita list_items page=2 per_page=10
$ qiita create_item < params.json
```

![](images/cli.png)
