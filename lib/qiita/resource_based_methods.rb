module Qiita
  module ResourceBasedMethods
    def create_access_token(params = nil, headers = nil)
      client.post("/api/v2/access_tokens", params, headers)
    end

    def delete_access_token(token, params = nil, headers = nil)
      client.delete("/api/v2/access_tokens/#{token}", params, headers)
    end

    def delete_comment(id, params = nil, headers = nil)
      client.delete("/api/v2/comments/#{id}", params, headers)
    end

    def update_comment(id, params = nil, headers = nil)
      client.patch("/api/v2/comments/#{id}", params, headers)
    end

    def list_item_comments(item_id, params = nil, headers = nil)
      client.get("/api/v2/items/#{item_id}/comments", params, headers)
    end

    def create_item_comment(item_id, params = nil, headers = nil)
      client.post("/api/v2/items/#{item_id}/comments", params, headers)
    end

    def list_items(params = nil, headers = nil)
      client.get("/api/v2/items", params, headers)
    end

    def create_item(params = nil, headers = nil)
      client.post("/api/v2/items", params, headers)
    end

    def get_item(id, params = nil, headers = nil)
      client.get("/api/v2/items/#{id}", params, headers)
    end

    def update_item(id, params = nil, headers = nil)
      client.patch("/api/v2/items/#{id}", params, headers)
    end

    def delete_item(id, params = nil, headers = nil)
      client.delete("/api/v2/items/#{id}", params, headers)
    end

    def list_tag_items(id, params = nil, headers = nil)
      client.get("/api/v2/tags/#{id}/items", params, headers)
    end

    def list_user_items(user_id, params = nil, headers = nil)
      client.get("/api/v2/users/#{user_id}/items", params, headers)
    end

    def list_user_stocks(user_id, params = nil, headers = nil)
      client.get("/api/v2/users/#{user_id}/stocks", params, headers)
    end

    def stock_item(item_id, params = nil, headers = nil)
      client.put("/api/v2/items/#{item_id}/stock", params, headers)
    end

    def unstock_item(item_id, params = nil, headers = nil)
      client.delete("/api/v2/items/#{item_id}/stock", params, headers)
    end

    def lgtm_item(item_id, params = nil, headers = nil)
      client.put("/api/v2/items/#{item_id}/lgtm", params, headers)
    end

    def unlgtm_item(item_id, params = nil, headers = nil)
      client.delete("/api/v2/items/#{item_id}/lgtm", params, headers)
    end

    def list_projects(params = nil, headers = nil)
      client.get("/api/v2/projects", params, headers)
    end

    def get_project(id, params = nil, headers = nil)
      client.get("/api/v2/projects/#{id}", params, headers)
    end

    def create_project(params = nil, headers = nil)
      client.post("/api/v2/projects", params, headers)
    end

    def delete_project(id, params = nil, headers = nil)
      client.delete("/api/v2/projects/#{id}", params, headers)
    end

    def update_project(id, params = nil, headers = nil)
      client.patch("/api/v2/projects/#{id}", params, headers)
    end

    def list_tags(params = nil, headers = nil)
      client.get("/api/v2/tags", params, headers)
    end

    def get_tag(id, params = nil, headers = nil)
      client.get("/api/v2/tags/#{id}", params, headers)
    end

    def list_user_following_tags(user_id, params = nil, headers = nil)
      client.get("/api/v2/users/#{user_id}/following_tags", params, headers)
    end

    def list_templates(params = nil, headers = nil)
      client.get("/api/v2/templates", params, headers)
    end

    def delete_template(id, params = nil, headers = nil)
      client.delete("/api/v2/templates/#{id}", params, headers)
    end

    def create_template(params = nil, headers = nil)
      client.post("/api/v2/templates", params, headers)
    end

    def update_template(id, params = nil, headers = nil)
      client.patch("/api/v2/templates/#{id}", params, headers)
    end

    def list_users(params = nil, headers = nil)
      client.get("/api/v2/users", params, headers)
    end

    def get_user(id, params = nil, headers = nil)
      client.get("/api/v2/users/#{id}", params, headers)
    end

    def get_authenticated_user(params = nil, headers = nil)
      client.get("/api/v2/user", params, headers)
    end

    def list_user_followees(user_id, params = nil, headers = nil)
      client.get("/api/v2/users/#{user_id}/followees", params, headers)
    end

    def list_user_followers(user_id, params = nil, headers = nil)
      client.get("/api/v2/users/#{user_id}/followers", params, headers)
    end
  end
end
