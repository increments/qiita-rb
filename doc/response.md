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

