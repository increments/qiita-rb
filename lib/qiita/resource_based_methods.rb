module Qiita
  module ResourceBasedMethods
    # ### Qiita::Client#create_access_token(params = nil, headers = nil)
    # 与えられた認証情報をもとに新しいアクセストークンを発行します。
    #
    def create_access_token(params = nil, headers = nil)
      post("/api/v2/access_tokens", params, headers)
    end

    # ### Qiita::Client#delete_access_token(token, params = nil, headers = nil)
    # 与えられたアクセストークンを失効させ、それ以降利用されないようにします。
    #
    def delete_access_token(token, params = nil, headers = nil)
      delete("/api/v2/access_tokens/#{token}", params, headers)
    end

    # ### Qiita::Client#get_comment(id, params = nil, headers = nil)
    # 特定のコメントを返します。
    #
    def get_comment(id, params = nil, headers = nil)
      get("/api/v2/comments/#{id}", params, headers)
    end

    # ### Qiita::Client#delete_comment(id, params = nil, headers = nil)
    # 特定のコメントを削除します。
    #
    def delete_comment(id, params = nil, headers = nil)
      delete("/api/v2/comments/#{id}", params, headers)
    end

    # ### Qiita::Client#update_comment(id, params = nil, headers = nil)
    # 特定のコメントを更新します。
    #
    def update_comment(id, params = nil, headers = nil)
      patch("/api/v2/comments/#{id}", params, headers)
    end

    # ### Qiita::Client#list_item_comments(item_id, params = nil, headers = nil)
    # 特定の投稿に寄せられたコメント一覧を返します。
    #
    def list_item_comments(item_id, params = nil, headers = nil)
      get("/api/v2/items/#{item_id}/comments", params, headers)
    end

    # ### Qiita::Client#create_item_comment(item_id, params = nil, headers = nil)
    # 特定の投稿にコメントを付けます。
    #
    def create_item_comment(item_id, params = nil, headers = nil)
      post("/api/v2/items/#{item_id}/comments", params, headers)
    end

    # ### Qiita::Client#thank_comment(comment_id, params = nil, headers = nil)
    # 特定のコメントにThankを付けます。
    #
    def thank_comment(comment_id, params = nil, headers = nil)
      put("/api/v2/comments/#{comment_id}/thank", params, headers)
    end

    # ### Qiita::Client#unthank_comment(comment_id, params = nil, headers = nil)
    # 特定のコメントからThankを外します。
    #
    def unthank_comment(comment_id, params = nil, headers = nil)
      delete("/api/v2/comments/#{comment_id}/thank", params, headers)
    end

    # ### Qiita::Client#list_items(params = nil, headers = nil)
    # 新着順に全ての投稿一覧を返します。
    #
    def list_items(params = nil, headers = nil)
      get("/api/v2/items", params, headers)
    end

    # ### Qiita::Client#create_item(params = nil, headers = nil)
    # 新たに投稿を作成します。
    #
    def create_item(params = nil, headers = nil)
      post("/api/v2/items", params, headers)
    end

    # ### Qiita::Client#get_item(id, params = nil, headers = nil)
    # 特定の投稿を返します。
    #
    def get_item(id, params = nil, headers = nil)
      get("/api/v2/items/#{id}", params, headers)
    end

    # ### Qiita::Client#update_item(id, params = nil, headers = nil)
    # 特定の投稿を編集します。
    #
    def update_item(id, params = nil, headers = nil)
      patch("/api/v2/items/#{id}", params, headers)
    end

    # ### Qiita::Client#delete_item(id, params = nil, headers = nil)
    # 特定の投稿を削除します。
    #
    def delete_item(id, params = nil, headers = nil)
      delete("/api/v2/items/#{id}", params, headers)
    end

    # ### Qiita::Client#list_tag_items(id, params = nil, headers = nil)
    # 特定のタグが付けられた投稿一覧を返します。
    #
    def list_tag_items(id, params = nil, headers = nil)
      get("/api/v2/tags/#{id}/items", params, headers)
    end

    # ### Qiita::Client#list_user_items(user_id, params = nil, headers = nil)
    # 特定のユーザの投稿一覧を返します。
    #
    def list_user_items(user_id, params = nil, headers = nil)
      get("/api/v2/users/#{user_id}/items", params, headers)
    end

    # ### Qiita::Client#list_user_stocks(user_id, params = nil, headers = nil)
    # 特定のユーザがストックした投稿一覧を返します。
    #
    def list_user_stocks(user_id, params = nil, headers = nil)
      get("/api/v2/users/#{user_id}/stocks", params, headers)
    end

    # ### Qiita::Client#stock_item(item_id, params = nil, headers = nil)
    # 特定の投稿をストックします。
    #
    def stock_item(item_id, params = nil, headers = nil)
      put("/api/v2/items/#{item_id}/stock", params, headers)
    end

    # ### Qiita::Client#unstock_item(item_id, params = nil, headers = nil)
    # 特定の投稿をストックから取り除きます。
    #
    def unstock_item(item_id, params = nil, headers = nil)
      delete("/api/v2/items/#{item_id}/stock", params, headers)
    end

    # ### Qiita::Client#lgtm_item(item_id, params = nil, headers = nil)
    # 特定の投稿に「いいね！」を付けます。
    #
    def lgtm_item(item_id, params = nil, headers = nil)
      put("/api/v2/items/#{item_id}/lgtm", params, headers)
    end

    # ### Qiita::Client#unlgtm_item(item_id, params = nil, headers = nil)
    # 特定の投稿への「いいね！」を取り消します。
    #
    def unlgtm_item(item_id, params = nil, headers = nil)
      delete("/api/v2/items/#{item_id}/lgtm", params, headers)
    end

    # ### Qiita::Client#list_projects(params = nil, headers = nil)
    # チーム内に存在するプロジェクト一覧を返します。
    #
    def list_projects(params = nil, headers = nil)
      get("/api/v2/projects", params, headers)
    end

    # ### Qiita::Client#get_project(id, params = nil, headers = nil)
    # 特定のプロジェクトを返します。
    #
    def get_project(id, params = nil, headers = nil)
      get("/api/v2/projects/#{id}", params, headers)
    end

    # ### Qiita::Client#create_project(params = nil, headers = nil)
    # プロジェクトを新たに作成します。
    #
    def create_project(params = nil, headers = nil)
      post("/api/v2/projects", params, headers)
    end

    # ### Qiita::Client#delete_project(id, params = nil, headers = nil)
    # 特定のプロジェクトを削除します。
    #
    def delete_project(id, params = nil, headers = nil)
      delete("/api/v2/projects/#{id}", params, headers)
    end

    # ### Qiita::Client#update_project(id, params = nil, headers = nil)
    # 特定のプロジェクトを編集します。
    #
    def update_project(id, params = nil, headers = nil)
      patch("/api/v2/projects/#{id}", params, headers)
    end

    # ### Qiita::Client#create_expanded_template(params = nil, headers = nil)
    # 受け取ったテンプレート用文字列の変数を展開して返します。
    #
    def create_expanded_template(params = nil, headers = nil)
      post("/api/v2/expanded_templates", params, headers)
    end

    # ### Qiita::Client#list_tags(params = nil, headers = nil)
    # 全てのタグ一覧を返します。
    #
    def list_tags(params = nil, headers = nil)
      get("/api/v2/tags", params, headers)
    end

    # ### Qiita::Client#get_tag(id, params = nil, headers = nil)
    # 特定のタグを返します。
    #
    def get_tag(id, params = nil, headers = nil)
      get("/api/v2/tags/#{id}", params, headers)
    end

    # ### Qiita::Client#list_user_following_tags(user_id, params = nil, headers = nil)
    # 特定のユーザがフォローしているタグ一覧を返します。
    #
    def list_user_following_tags(user_id, params = nil, headers = nil)
      get("/api/v2/users/#{user_id}/following_tags", params, headers)
    end

    # ### Qiita::Client#list_templates(params = nil, headers = nil)
    # 全てのテンプレート一覧を返します。
    #
    def list_templates(params = nil, headers = nil)
      get("/api/v2/templates", params, headers)
    end

    # ### Qiita::Client#get_template(id, params = nil, headers = nil)
    # 特定のテンプレートを返します。
    #
    def get_template(id, params = nil, headers = nil)
      get("/api/v2/templates/#{id}", params, headers)
    end

    # ### Qiita::Client#delete_template(id, params = nil, headers = nil)
    # 特定のテンプレートを削除します。
    #
    def delete_template(id, params = nil, headers = nil)
      delete("/api/v2/templates/#{id}", params, headers)
    end

    # ### Qiita::Client#create_template(params = nil, headers = nil)
    # 新しくテンプレートを作成します。
    #
    def create_template(params = nil, headers = nil)
      post("/api/v2/templates", params, headers)
    end

    # ### Qiita::Client#update_template(id, params = nil, headers = nil)
    # 特定のテンプレートを編集します。
    #
    def update_template(id, params = nil, headers = nil)
      patch("/api/v2/templates/#{id}", params, headers)
    end

    # ### Qiita::Client#list_users(params = nil, headers = nil)
    # 全てのユーザの一覧を返します。
    #
    def list_users(params = nil, headers = nil)
      get("/api/v2/users", params, headers)
    end

    # ### Qiita::Client#get_user(id, params = nil, headers = nil)
    # 特定のユーザを返します。
    #
    def get_user(id, params = nil, headers = nil)
      get("/api/v2/users/#{id}", params, headers)
    end

    # ### Qiita::Client#get_authenticated_user(params = nil, headers = nil)
    # アクセストークンに紐付いたユーザを返します。
    #
    def get_authenticated_user(params = nil, headers = nil)
      get("/api/v2/authenticated_user", params, headers)
    end

    # ### Qiita::Client#list_user_followees(user_id, params = nil, headers = nil)
    # 特定のユーザがフォローしているユーザ一覧を返します。
    #
    def list_user_followees(user_id, params = nil, headers = nil)
      get("/api/v2/users/#{user_id}/followees", params, headers)
    end

    # ### Qiita::Client#list_user_followers(user_id, params = nil, headers = nil)
    # 特定のユーザをフォローしているユーザ一覧を返します。
    #
    def list_user_followers(user_id, params = nil, headers = nil)
      get("/api/v2/users/#{user_id}/followers", params, headers)
    end

    # ### Qiita::Client#list_item_stockers(item_id, params = nil, headers = nil)
    # 特定の投稿をストックしているユーザ一覧を返します。
    #
    def list_item_stockers(item_id, params = nil, headers = nil)
      get("/api/v2/items/#{item_id}/stockers", params, headers)
    end
  end
end
