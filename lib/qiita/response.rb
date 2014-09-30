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

    def to_s
      @to_s ||= ResponseRenderer.new(self, show_body: true, show_header: true).to_s
    end

    def status_message
      Rack::Utils::HTTP_STATUS_CODES[status]
    end

    private

    def links_table
      @links_table ||= (headers["Link"] || "").split(", ").inject({}) do |table, section|
        url, rel = section.match(/\A<(.+)>; rel="(.+)"\z/)[1..2]
        table.merge(rel => url)
      end
    end
  end
end
