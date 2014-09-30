### Qiita::Client.new(options = {})
Creates a new instance of `Qiita::Client` class.
`options` can have following key-values:

* `access_token` - (String) Access token issued to authenticate and authorize user.
* `host` - (String) Hostname where this client accesses to.
* `team` - (String) Team name to be used as subdomain.

```rb
Qiita::Client.new
Qiita::Client.new(access_token: "...")
Qiita::Client.new(host: "my-team-name.qiita.com")
Qiita::Client.new(team: "my-team-name")
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

### Qiita::Client#connection
Returns a Faraday::Connection to customize by your favorite middlewares.

```rb
client.connection.response :logger
```

### Qiita::Client#create_access_token(params = nil, headers = nil)
与えられた認証情報をもとに新しいアクセストークンを発行します。

### Qiita::Client#delete_access_token(token, params = nil, headers = nil)
与えられたアクセストークンを失効させ、それ以降利用されないようにします。

### Qiita::Client#get_comment(id, params = nil, headers = nil)
特定のコメントを返します。

### Qiita::Client#delete_comment(id, params = nil, headers = nil)
特定のコメントを削除します。

### Qiita::Client#update_comment(id, params = nil, headers = nil)
特定のコメントを更新します。

### Qiita::Client#list_item_comments(item_id, params = nil, headers = nil)
特定の投稿に寄せられたコメント一覧を返します。

### Qiita::Client#create_item_comment(item_id, params = nil, headers = nil)
特定の投稿にコメントを付けます。

### Qiita::Client#thank_comment(comment_id, params = nil, headers = nil)
特定のコメントにThankを付けます。

### Qiita::Client#unthank_comment(comment_id, params = nil, headers = nil)
特定のコメントからThankを外します。

### Qiita::Client#list_items(params = nil, headers = nil)
新着順に全ての投稿一覧を返します。

### Qiita::Client#create_item(params = nil, headers = nil)
新たに投稿を作成します。

### Qiita::Client#get_item(id, params = nil, headers = nil)
特定の投稿を返します。

### Qiita::Client#update_item(id, params = nil, headers = nil)
特定の投稿を編集します。

### Qiita::Client#delete_item(id, params = nil, headers = nil)
特定の投稿を削除します。

### Qiita::Client#list_tag_items(id, params = nil, headers = nil)
特定のタグが付けられた投稿一覧を返します。

### Qiita::Client#list_user_items(user_id, params = nil, headers = nil)
特定のユーザの投稿一覧を返します。

### Qiita::Client#list_user_stocks(user_id, params = nil, headers = nil)
特定のユーザがストックした投稿一覧を返します。

### Qiita::Client#stock_item(item_id, params = nil, headers = nil)
特定の投稿をストックします。

### Qiita::Client#unstock_item(item_id, params = nil, headers = nil)
特定の投稿をストックから取り除きます。

### Qiita::Client#lgtm_item(item_id, params = nil, headers = nil)
特定の投稿に「いいね！」を付けます。

### Qiita::Client#unlgtm_item(item_id, params = nil, headers = nil)
特定の投稿への「いいね！」を取り消します。

### Qiita::Client#list_projects(params = nil, headers = nil)
チーム内に存在するプロジェクト一覧を返します。

### Qiita::Client#get_project(id, params = nil, headers = nil)
特定のプロジェクトを返します。

### Qiita::Client#create_project(params = nil, headers = nil)
プロジェクトを新たに作成します。

### Qiita::Client#delete_project(id, params = nil, headers = nil)
特定のプロジェクトを削除します。

### Qiita::Client#update_project(id, params = nil, headers = nil)
特定のプロジェクトを編集します。

### Qiita::Client#create_expanded_template(params = nil, headers = nil)
受け取ったテンプレート用文字列の変数を展開して返します。

### Qiita::Client#list_tags(params = nil, headers = nil)
全てのタグ一覧を返します。

### Qiita::Client#get_tag(id, params = nil, headers = nil)
特定のタグを返します。

### Qiita::Client#list_user_following_tags(user_id, params = nil, headers = nil)
特定のユーザがフォローしているタグ一覧を返します。

### Qiita::Client#list_templates(params = nil, headers = nil)
全てのテンプレート一覧を返します。

### Qiita::Client#get_template(id, params = nil, headers = nil)
特定のテンプレートを返します。

### Qiita::Client#delete_template(id, params = nil, headers = nil)
特定のテンプレートを削除します。

### Qiita::Client#create_template(params = nil, headers = nil)
新しくテンプレートを作成します。

### Qiita::Client#update_template(id, params = nil, headers = nil)
特定のテンプレートを編集します。

### Qiita::Client#list_users(params = nil, headers = nil)
全てのユーザの一覧を返します。

### Qiita::Client#get_user(id, params = nil, headers = nil)
特定のユーザを返します。

### Qiita::Client#get_authenticated_user(params = nil, headers = nil)
アクセストークンに紐付いたユーザを返します。

### Qiita::Client#list_user_followees(user_id, params = nil, headers = nil)
特定のユーザがフォローしているユーザ一覧を返します。

### Qiita::Client#list_user_followers(user_id, params = nil, headers = nil)
特定のユーザをフォローしているユーザ一覧を返します。

