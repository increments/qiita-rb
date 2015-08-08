module Qiita
  module ResourceBasedMethods
    # ### Qiita::Client#create_access_token(params = nil, headers = nil)
    # Create a new access token.
    #
    def create_access_token(params = nil, headers = nil)
      post("/api/v2/access_tokens", params, headers)
    end

    # ### Qiita::Client#delete_access_token(params = nil, headers = nil)
    # Deactivate an access token.
    #
    def delete_access_token(params = nil, headers = nil)
      delete("/api/v2/access_tokens/#{access_token}", params, headers)
    end

    # ### Qiita::Client#get_authenticated_user(params = nil, headers = nil)
    # Get a user associated to the current access token.
    #
    def get_authenticated_user(params = nil, headers = nil)
      get("/api/v2/authenticated_user", params, headers)
    end

    # ### Qiita::Client#delete_comment(params = nil, headers = nil)
    # Delete a comment.
    #
    def delete_comment(params = nil, headers = nil)
      delete("/api/v2/comments/#{comment_id}", params, headers)
    end

    # ### Qiita::Client#get_comment(params = nil, headers = nil)
    # Get a comment.
    #
    def get_comment(params = nil, headers = nil)
      get("/api/v2/comments/#{comment_id}", params, headers)
    end

    # ### Qiita::Client#update_comment(params = nil, headers = nil)
    # Update a comment.
    #
    def update_comment(params = nil, headers = nil)
      patch("/api/v2/comments/#{comment_id}", params, headers)
    end

    # ### Qiita::Client#unthank_comment(params = nil, headers = nil)
    # Delete a thank from a comment.
    #
    def unthank_comment(params = nil, headers = nil)
      delete("/api/v2/comments/#{comment_id}/thank", params, headers)
    end

    # ### Qiita::Client#thank_comment(params = nil, headers = nil)
    # Send a thank to a comment.
    #
    def thank_comment(params = nil, headers = nil)
      put("/api/v2/comments/#{comment_id}/thank", params, headers)
    end

    # ### Qiita::Client#list_item_comments(params = nil, headers = nil)
    # List comments on an item in newest order.
    #
    def list_item_comments(params = nil, headers = nil)
      get("/api/v2/items/#{item_id}/comments", params, headers)
    end

    # ### Qiita::Client#create_item_comment(params = nil, headers = nil)
    # Post a comment on an item.
    #
    def create_item_comment(params = nil, headers = nil)
      post("/api/v2/items/#{item_id}/comments", params, headers)
    end

    # ### Qiita::Client#create_expanded_template(params = nil, headers = nil)
    # Get a template where its variables are expanded.
    #
    def create_expanded_template(params = nil, headers = nil)
      post("/api/v2/expanded_templates", params, headers)
    end

    # ### Qiita::Client#list_authenticated_user_items(params = nil, headers = nil)
    # List the authenticated user's items in newest order
    #
    def list_authenticated_user_items(params = nil, headers = nil)
      get("/api/v2/authenticated_user/items", params, headers)
    end

    # ### Qiita::Client#list_items(params = nil, headers = nil)
    # List items.
    #
    def list_items(params = nil, headers = nil)
      get("/api/v2/items", params, headers)
    end

    # ### Qiita::Client#create_item(params = nil, headers = nil)
    # Create an item.
    #
    def create_item(params = nil, headers = nil)
      post("/api/v2/items", params, headers)
    end

    # ### Qiita::Client#delete_item(params = nil, headers = nil)
    # Delete an item.
    #
    def delete_item(params = nil, headers = nil)
      get("/api/v2/items/#{item_id}", params, headers)
    end

    # ### Qiita::Client#get_item(params = nil, headers = nil)
    # Get an item.
    #
    def get_item(params = nil, headers = nil)
      get("/api/v2/items/#{item_id}", params, headers)
    end

    # ### Qiita::Client#update_item(params = nil, headers = nil)
    # Update an item.
    #
    def update_item(params = nil, headers = nil)
      patch("/api/v2/items/#{item_id}", params, headers)
    end

    # ### Qiita::Client#unlike_item(params = nil, headers = nil)
    # Unlike an item (only available on Qiita:Team).
    #
    def unlike_item(params = nil, headers = nil)
      delete("/api/v2/items/#{item_id}/like", params, headers)
    end

    # ### Qiita::Client#like_item(params = nil, headers = nil)
    # Like an item (only available on Qiita:Team).
    #
    def like_item(params = nil, headers = nil)
      put("/api/v2/items/#{item_id}/like", params, headers)
    end

    # ### Qiita::Client#unstock_item(params = nil, headers = nil)
    # Unstock an item.
    #
    def unstock_item(params = nil, headers = nil)
      delete("/api/v2/items/#{item_id}/stock", params, headers)
    end

    # ### Qiita::Client#get_item_stock(params = nil, headers = nil)
    # Check if you stocked an item.
    #
    def get_item_stock(params = nil, headers = nil)
      get("/api/v2/items/#{item_id}/stock", params, headers)
    end

    # ### Qiita::Client#stock_item(params = nil, headers = nil)
    # Stock an item.
    #
    def stock_item(params = nil, headers = nil)
      put("/api/v2/items/#{item_id}/stock", params, headers)
    end

    # ### Qiita::Client#stock_item(params = nil, headers = nil)
    # Stock an item.
    #
    def stock_item(params = nil, headers = nil)
      put("/api/v2/items/#{item_id}/stock", params, headers)
    end

    # ### Qiita::Client#list_tag_items(params = nil, headers = nil)
    # List tagged items in recently-tagged order.
    #
    def list_tag_items(params = nil, headers = nil)
      get("/api/v2/tags/#{tag_id}/items", params, headers)
    end

    # ### Qiita::Client#list_user_items(params = nil, headers = nil)
    # List a user's items in newest order.
    #
    def list_user_items(params = nil, headers = nil)
      get("/api/v2/users/#{user_id}/items", params, headers)
    end

    # ### Qiita::Client#list_user_stocks(params = nil, headers = nil)
    # List a user's stocked items in recently-stocked order.
    #
    def list_user_stocks(params = nil, headers = nil)
      get("/api/v2/users/#{user_id}/stocks", params, headers)
    end

    # ### Qiita::Client#list_projects(params = nil, headers = nil)
    # List projects in newest order.
    #
    def list_projects(params = nil, headers = nil)
      get("/api/v2/projects", params, headers)
    end

    # ### Qiita::Client#create_project(params = nil, headers = nil)
    # Create a new project.
    #
    def create_project(params = nil, headers = nil)
      post("/api/v2/projects", params, headers)
    end

    # ### Qiita::Client#delete_project(params = nil, headers = nil)
    # Delete a project.
    #
    def delete_project(params = nil, headers = nil)
      delete("/api/v2/projects/#{project_id}", params, headers)
    end

    # ### Qiita::Client#get_project(params = nil, headers = nil)
    # Get a project.
    #
    def get_project(params = nil, headers = nil)
      get("/api/v2/projects/#{project_id}", params, headers)
    end

    # ### Qiita::Client#patch_project(params = nil, headers = nil)
    # Update a project
    #
    def patch_project(params = nil, headers = nil)
      patch("/api/v2/projects/#{project_id}", params, headers)
    end

    # ### Qiita::Client#list_tags(params = nil, headers = nil)
    # List tags in newest order.
    #
    def list_tags(params = nil, headers = nil)
      get("/api/v2/tags", params, headers)
    end

    # ### Qiita::Client#get_tag(params = nil, headers = nil)
    # Get a tag.
    #
    def get_tag(params = nil, headers = nil)
      get("/api/v2/tags/#{tag_id}", params, headers)
    end

    # ### Qiita::Client#list_user_following_tags(params = nil, headers = nil)
    # List tags a user is following to in recently-tagged order.
    #
    def list_user_following_tags(params = nil, headers = nil)
      get("/api/v2/users/#{user_id}/following_tags", params, headers)
    end

    # ### Qiita::Client#unfollow_tag(params = nil, headers = nil)
    # Unfollow a tag.
    #
    def unfollow_tag(params = nil, headers = nil)
      delete("/api/v2/tags/#{tag_id}/following", params, headers)
    end

    # ### Qiita::Client#get_tag_following(params = nil, headers = nil)
    # Check if you are following a tag or not.
    #
    def get_tag_following(params = nil, headers = nil)
      get("/api/v2/tags/#{tag_id}/following", params, headers)
    end

    # ### Qiita::Client#follow_tag(params = nil, headers = nil)
    # Follow a tag.
    #
    def follow_tag(params = nil, headers = nil)
      put("/api/v2/tags/#{tag_id}/following", params, headers)
    end

    # ### Qiita::Client#create_tagging(params = nil, headers = nil)
    # Add a tag to an item (only available on Qiita:Team)
    #
    def create_tagging(params = nil, headers = nil)
      post("/api/v2/items/#{item_id}/taggings", params, headers)
    end

    # ### Qiita::Client#delete_tagging(params = nil, headers = nil)
    # Remove a tag from an item (only available on Qiita:Team)
    #
    def delete_tagging(params = nil, headers = nil)
      delete("/api/v2/items/#{item_id}/taggings/#{tagging_id}", params, headers)
    end

    # ### Qiita::Client#list_teams(params = nil, headers = nil)
    # List teams the user belongs to in newest order.
    #
    def list_teams(params = nil, headers = nil)
      get("/api/v2/teams", params, headers)
    end

    # ### Qiita::Client#list_templates(params = nil, headers = nil)
    # List templates in a team.
    #
    def list_templates(params = nil, headers = nil)
      get("/api/v2/templates", params, headers)
    end

    # ### Qiita::Client#delete_template(params = nil, headers = nil)
    # Delete a template.
    #
    def delete_template(params = nil, headers = nil)
      delete("/api/v2/templates/#{template_id}", params, headers)
    end

    # ### Qiita::Client#get_template(params = nil, headers = nil)
    # Get a template.
    #
    def get_template(params = nil, headers = nil)
      get("/api/v2/templates/#{template_id}", params, headers)
    end

    # ### Qiita::Client#create_template(params = nil, headers = nil)
    # Create a new template.
    #
    def create_template(params = nil, headers = nil)
      post("/api/v2/templates", params, headers)
    end

    # ### Qiita::Client#update_template(params = nil, headers = nil)
    # Update a template.
    #
    def update_template(params = nil, headers = nil)
      patch("/api/v2/templates/#{template_id}", params, headers)
    end

    # ### Qiita::Client#list_item_stockers(params = nil, headers = nil)
    # List users who stocked an item in recent-stocked order.
    #
    def list_item_stockers(params = nil, headers = nil)
      get("/api/v2/items/#{item_id}/stockers", params, headers)
    end

    # ### Qiita::Client#list_users(params = nil, headers = nil)
    # List users in newest order.
    #
    def list_users(params = nil, headers = nil)
      get("/api/v2/users", params, headers)
    end

    # ### Qiita::Client#get_user(params = nil, headers = nil)
    # Get a user.
    #
    def get_user(params = nil, headers = nil)
      get("/api/v2/users/#{user_id}", params, headers)
    end

    # ### Qiita::Client#list_user_followees(params = nil, headers = nil)
    # List users a user is following.
    #
    def list_user_followees(params = nil, headers = nil)
      get("/api/v2/users/#{user_id}/followees", params, headers)
    end

    # ### Qiita::Client#list_user_followers(params = nil, headers = nil)
    # List users who are following a user.
    #
    def list_user_followers(params = nil, headers = nil)
      get("/api/v2/users/#{user_id}/followers", params, headers)
    end

    # ### Qiita::Client#unfollow_user(params = nil, headers = nil)
    # Unfollow a user.
    #
    def unfollow_user(params = nil, headers = nil)
      delete("/api/v2/users/#{user_id}/following", params, headers)
    end

    # ### Qiita::Client#get_user_following(params = nil, headers = nil)
    # Check if the current user is following a user.
    #
    def get_user_following(params = nil, headers = nil)
      get("/api/v2/users/#{user_id}/following", params, headers)
    end

    # ### Qiita::Client#follow_user(params = nil, headers = nil)
    # Follow a user.
    #
    def follow_user(params = nil, headers = nil)
      put("/api/v2/users/#{user_id}/following", params, headers)
    end
  end
end
