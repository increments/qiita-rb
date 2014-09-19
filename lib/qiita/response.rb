# ## Qiita::Response
# A class for response data returned from API.
#
module Qiita
  class Response
    def initialize(faraday_response)
      @faraday_response = faraday_response
    end

    # ### Qiita::Response#body
    # Returns response body returned from API as a `Hash` or an `Array` of `Hash`.
    #
    # ```rb
    # response.body #=> { ... }
    # ```
    #
    def body
      @faraday_response.body
    end

    # ### Qiita::Response#headers
    # Returns response headers returned from API as a `Hash`.
    #
    # ```rb
    # response.headers #=> { "Content-Type" => "application/json" }
    # ```
    #
    def headers
      @headers ||= @faraday_response.headers.inject({}) do |result, (key, value)|
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
      @faraday_response.status
    end
  end
end
