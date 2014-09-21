### Qiita::Response#body
Returns response body returned from API as a `Hash` or an `Array` of `Hash`.

```rb
response.body #=> { ... }
```

### Qiita::Response#headers
Returns response headers returned from API as a `Hash`.

```rb
response.headers #=> { "Content-Type" => "application/json" }
```

### Qiita::Response#status
Returns response status code returned from API as a `Fixnum`.

```rb
response.status #=> 200
```

### Qiita::Response#to_s
Returns a String containing curl-like response.

```rb
puts client.get("/api/v2/user")
```

```
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Connection: Close
Content-Length: 448
Content-Type: application/json; charset=utf-8
Date: Fri, 19 Sep 2014 10:26:38 GMT
Etag: "15e5e2071ea5c4ba75908b351f049ec0"
Rate-Limit: 300
Rate-Remaining: 289
Rate-Reset: 1411122764
Server: nginx
Status: 200 OK
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 3efdda8c-ae89-4a96-8e53-6279856b5a9e
X-Runtime: 0.126421
X-Xss-Protection: 1; mode=block

{"description"=>"", "facebook_id"=>"", "followers_count"=>149, "followees_count"=>22, "github_login_name"=>"r7kamura", "items_count"=>13, "linkedin_id"=>"", "location"=>"", "name"=>"", "organization"=>"Increments Inc.", "profile_image_url"=>"https://secure.gravatar.com/avatar/089127ffb92a19d3d37815673cca06dc?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png", "twitter_screen_name"=>"r7kamura", "url_name"=>"r7kamura", "website_url"=>""}
```

