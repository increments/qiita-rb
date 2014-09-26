### Qiita::Response#body
Returns response body returned from API as a `Hash` or an `Array` of `Hash`.

```rb
response.body #=> { ... }
```

### Qiita::Response#first_page_url
Returns first page URL or nil.

### Qiita::Response#last_page_url
Returns last page URL or nil.

### Qiita::Response#next_page_url
Returns next page URL or nil.

### Qiita::Response#previous_page_url
Returns previous page URL or nil.

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

