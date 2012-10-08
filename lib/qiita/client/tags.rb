module Qiita
  class Client
    module Tags
      def tag_items(url_name, params={})
        get "/tags/#{url_name}/items", params
      end

      def tags(params={})
        get "/tags", params
      end
    end
  end
end
