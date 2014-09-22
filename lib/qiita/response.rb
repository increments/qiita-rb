# ## Qiita::Response
# A class for response data returned from API.
#
module Qiita
  class Response
    def initialize(faraday_response)
      @raw_body = faraday_response.body
      @raw_headers = faraday_response.headers
      @raw_status = faraday_response.status
    end

    # ### Qiita::Response#body
    # Returns response body returned from API as a `Hash` or an `Array` of `Hash`.
    #
    # ```rb
    # response.body #=> { ... }
    # ```
    #
    def body
      @raw_body
    end

    # ### Qiita::Response#first_page_url
    # Returns first page URL or nil.
    #
    def first_page_url
      links_table["first"]
    end

    # ### Qiita::Response#last_page_url
    # Returns last page URL or nil.
    #
    def last_page_url
      links_table["last"]
    end

    # ### Qiita::Response#next_page_url
    # Returns next page URL or nil.
    #
    def next_page_url
      links_table["next"]
    end

    # ### Qiita::Response#previous_page_url
    # Returns previous page URL or nil.
    #
    def previous_page_url
      links_table["previous"]
    end

    # ### Qiita::Response#headers
    # Returns response headers returned from API as a `Hash`.
    #
    # ```rb
    # response.headers #=> { "Content-Type" => "application/json" }
    # ```
    #
    def headers
      @headers ||= @raw_headers.inject({}) do |result, (key, value)|
        result.merge(key.split("-").map(&:capitalize).join("-") => value)
      end
    end

    # ### Qiita::Response#status
    # Returns response status code returned from API as a `Fixnum`.
    #
    # ```rb
    # response.status #=> 200
    # ```
    #
    def status
      @raw_status
    end

    # ### Qiita::Response#to_s
    # Returns a String containing curl-like response.
    #
    # ```rb
    # puts client.get("/api/v2/user")
    # ```
    #
    # ```
    # HTTP/1.1 200 OK
    # Cache-Control: max-age=0, private, must-revalidate
    # Connection: Close
    # Content-Length: 448
    # Content-Type: application/json; charset=utf-8
    # Date: Fri, 19 Sep 2014 10:26:38 GMT
    # Etag: "15e5e2071ea5c4ba75908b351f049ec0"
    # Rate-Limit: 300
    # Rate-Remaining: 289
    # Rate-Reset: 1411122764
    # Server: nginx
    # Status: 200 OK
    # X-Content-Type-Options: nosniff
    # X-Frame-Options: SAMEORIGIN
    # X-Request-Id: 3efdda8c-ae89-4a96-8e53-6279856b5a9e
    # X-Runtime: 0.126421
    # X-Xss-Protection: 1; mode=block
    #
    # {"description"=>"", "facebook_id"=>"", "followers_count"=>149, "followees_count"=>22, "github_login_name"=>"r7kamura", "items_count"=>13, "linkedin_id"=>"", "location"=>"", "name"=>"", "organization"=>"Increments Inc.", "profile_image_url"=>"https://secure.gravatar.com/avatar/089127ffb92a19d3d37815673cca06dc?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png", "twitter_screen_name"=>"r7kamura", "url_name"=>"r7kamura", "website_url"=>""}
    # ```
    #
    def to_s
      @to_s ||= begin
        string = "HTTP/1.1 #{status} #{status_message}\n"
        string << headers.sort.map {|key, value| "#{key}: #{value}" }.join("\n") << "\n"
        string << "\n#{body}\n" unless body.empty?
        string
      end
    end

    private

    def status_message
      Rack::Utils::HTTP_STATUS_CODES[status]
    end

    def links_table
      @links_table ||= (headers["Link"] || "").split(", ").inject({}) do |table, section|
        url, rel = section.match(/\A<(.+)>; rel="(.+)"\z/)[1..2]
        table.merge(rel => url)
      end
    end
  end
end
