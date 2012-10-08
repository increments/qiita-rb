module Qiita
  class Client
    module Users
      def user_items(url_name=nil, params={})
        path = url_name ? "/users/#{url_name}/items" : '/items'
        get path, params
      end
    end
  end
end
