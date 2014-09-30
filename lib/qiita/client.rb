require "qiita/resource_based_methods"
require "qiita/version"

## Qiita::Client
# A class for API client to send HTTP request.
#
module Qiita
  class Client
    DEFAULT_ACCEPT = "application/json"

    DEFAULT_HOST = "qiita.com"

    DEFAULT_USER_AGENT = "Qiita Ruby Gem #{Qiita::VERSION}"

    DEFAULT_HEADERS = {
      "Accept" => DEFAULT_ACCEPT,
      "User-Agent" => DEFAULT_USER_AGENT,
    }

    include ResourceBasedMethods

    # ### Qiita::Client.new(options = {})
    # Creates a new instance of `Qiita::Client` class.
    # `options` can have following key-values:
    #
    # * `access_token` - (String) Access token issued to authenticate and authorize user.
    # * `host` - (String) Hostname where this client accesses to.
    # * `team` - (String) Team name to be used as subdomain.
    #
    # ```rb
    # Qiita::Client.new
    # Qiita::Client.new(access_token: "...")
    # Qiita::Client.new(host: "my-team-name.qiita.com")
    # Qiita::Client.new(team: "my-team-name")
    # ```
    #
    def initialize(access_token: nil, host: nil, team: nil)
      @access_token = access_token
      @host = host
      @team = team
    end

    # ### Qiita::Client#get(path, params = nil, headers = nil)
    # Sends GET request with given parameters, then returns a `Qiita::Response`.
    # `params` are url-encoded and used as URI query string.
    #
    # ```rb
    # client.get("/api/v2/items", page: 2)
    # ```
    #
    def get(path, params = nil, headers = nil)
      process(:get, path, params, headers)
    end

    # ### Qiita::Client#post(path, params = nil, headers = nil)
    # Sends POST request with given parameters, then returns a Qiita::Response.
    # `params` are JSON-encoded and used as request body.
    #
    # ```rb
    # client.post("/api/v2/items", title: "...", body: "...")
    # ```
    #
    def post(path, params = nil, headers = nil)
      process(:post, path, params, headers)
    end

    # ### Qiita::Client#patch(path, params = nil, headers = nil)
    # Sends PATCH request with given parameters, then returns a Qiita::Response.
    # `params` are JSON-encoded and used as request body.
    #
    # ```rb
    # client.patch("/api/v2/items/543efd13001e30837319", title: "...", body: "...")
    # ```
    #
    def patch(path, params = nil, headers = nil)
      process(:patch, path, params, headers)
    end

    # ### Qiita::Client#put(path, params = nil, headers = nil)
    # Sends PUT request, then returns a Qiita::Response.
    # `params` are JSON-encoded and used as request body.
    #
    # ```rb
    # client.put("/api/v2/items/543efd13001e30837319/stock")
    # ```
    #
    def put(path, params = nil, headers = nil)
      process(:put, path, params, headers)
    end

    # ### Qiita::Client#delete(path, params = nil, headers = nil)
    # Sends DELETE request, then returns a Qiita::Response.
    # `params` are url-encoded and used as URI query string.
    #
    # ```rb
    # client.delete("/api/v2/items/543efd13001e30837319/stock")
    # ```
    #
    def delete(path, params = nil, headers = nil)
      process(:delete, path, params, headers)
    end

    # ### Qiita::Client#connection
    # Returns a Faraday::Connection to customize by your favorite middlewares.
    #
    # ```rb
    # client.connection.response :logger
    # ```
    #
    def connection
      @connection ||= Faraday.new(headers: default_headers, url: url_prefix) do |connection|
        connection.request :json
        connection.response :json
        connection.adapter Faraday.default_adapter
      end
    end

    private

    def default_headers
      headers = DEFAULT_HEADERS.clone
      headers["Authorization"] = "Bearer #{@access_token}" if @access_token
      headers
    end

    def host
      case
      when @host
        @host
      when @team
        "#{@team}.#{DEFAULT_HOST}"
      else
        DEFAULT_HOST
      end
    end

    def process(request_method, path, params, headers)
      Qiita::Response.new(
        connection.send(
          request_method,
          path,
          params,
          headers,
        )
      )
    end

    def url_prefix
      "https://#{host}"
    end
  end
end
