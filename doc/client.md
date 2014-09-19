### Qiita::Client.new(options = {})
Creates a new instance of `Qiita::Client` class.
`options` can have following key-values:

* `access_token` - (String) Access token issued to authenticate and authorize user.
* `host` - (String) Hostname where this client accesses to.

```rb
Qiita::Client.new
Qiita::Client.new(access_token: "...")
Qiita::Client.new(host: "my-team-name.qiita.com")
```

### Qiita::Client#get(path, params = nil, headers = nil)
Sends GET request with given parameters, then returns a `Qiita::Response`.
`params` are url-encoded and used as URI query string.

```rb
client.get("/api/v2/items", page: 2)
```

### Qiita::Client#post(path, params = nil, headers = nil)
Sends POST request with given parameters, then returns a Qiita::Response.
`params` are JSON-encoded and used as request body.

```rb
client.post("/api/v2/items", title: "...", body: "...")
```

### Qiita::Client#patch(path, params = nil, headers = nil)
Sends PATCH request with given parameters, then returns a Qiita::Response.
`params` are JSON-encoded and used as request body.

```rb
client.patch("/api/v2/items/543efd13001e30837319", title: "...", body: "...")
```

### Qiita::Client#put(path, params = nil, headers = nil)
Sends PUT request, then returns a Qiita::Response.
`params` are JSON-encoded and used as request body.

```rb
client.put("/api/v2/items/543efd13001e30837319/stock")
```

### Qiita::Client#delete(path, params = nil, headers = nil)
Sends DELETE request, then returns a Qiita::Response.
`params` are url-encoded and used as URI query string.

```rb
client.delete("/api/v2/items/543efd13001e30837319/stock")
```

