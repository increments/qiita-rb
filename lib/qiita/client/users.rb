module Qiita
  class Client
    module Users
      def user_items(url_name=nil, params={})
        path = url_name ? "/users/#{url_name}/items" : '/items'
        get path, params
      end

      def user_following_tags(url_name, params={})
        get "/users/#{url_name}/following_tags", params
      end

      def user_following_users(url_name, params={})
        get "/users/#{url_name}/following_users", params
      end

      def user_stocks(url_name=nil, params={})
        path = url_name ? "/users/#{url_name}/stocks" : '/stocks'
        get path, params
      end

      def user(url_name)
        get "/users/#{url_name}"
      end
    end
  end
end
