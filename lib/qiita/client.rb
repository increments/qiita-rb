## Qiita::Client
# A class for API client to send HTTP request.
#
module Qiita
  class Client
    DEFAULT_HOST = "qiita.com"

    DEFAULT_USER_AGENT = "Qiita Ruby Gem #{Qiita::VERSION}"

    DEFAULT_HEADERS = { "User-Agent" => DEFAULT_USER_AGENT }

    def self.merge_params_into_path(path, params)
      uri = URI.parse(path)
      params = Rack::Utils.parse_nested_query(uri.query).merge(params)
      uri.query = Rack::Utils.build_query(params)
      uri.to_s
    end

    # ### Qiita::Client.new(options = {})
    # Creates a new instance of `Qiita::Client` class.
    # `options` can have following key-values:
    #
    # * `access_token` - (String) Access token issued to authenticate and authorize user.
    # * `host` - (String) Hostname where this client accesses to.
    #
    # ```rb
    # Qiita::Client.new
    # Qiita::Client.new(access_token: "...")
    # Qiita::Client.new(host: "my-team-name.qiita.com")
    # ```
    #
    def initialize(access_token: nil, host: DEFAULT_HOST)
      @access_token = access_token
      @host = host
    end

    # ### Qiita::Client#get(path, params = {}, headers = {})
    # Sends GET request with given parameters, then returns a `Qiita::Response`.
    # `params` are url-encoded and used as URI query string.
    #
    # ```rb
    # client.get("/api/v2/items", page: 2)
    # ```
    #
    def get(path, params = {}, headers = {})
      process(:get, self.class.merge_params_into_path(path, params), nil, headers)
    end

    # ### Qiita::Client#post(path, params = {}, headers = {})
    # Sends POST request with given parameters, then returns a Qiita::Response.
    # `params` are JSON-encoded and used as request body.
    #
    # ```rb
    # client.post("/api/v2/items", title: "...", body: "...")
    # ```
    #
    def post(path, params = {}, headers = {})
      process(:post, path, params, headers)
    end

    # ### Qiita::Client#patch(path, params = {}, headers = {})
    # Sends PATCH request with given parameters, then returns a Qiita::Response.
    # `params` are JSON-encoded and used as request body.
    #
    # ```rb
    # client.patch("/api/v2/items/543efd13001e30837319", title: "...", body: "...")
    # ```
    #
    def patch(path, params = {}, headers = {})
      process(:patch, path, params, headers)
    end

    # ### Qiita::Client#put(path, params = {}, headers = {})
    # Sends PUT request, then returns a Qiita::Response.
    #
    # ```rb
    # client.put("/api/v2/items/543efd13001e30837319/stock")
    # ```
    #
    def put(path, params = {}, headers = {})
      process(:put, path, params, headers)
    end

    # ### Qiita::Client#delete(path, params = {}, headers = {})
    # Sends DELETE request, then returns a Qiita::Response.
    #
    # ```rb
    # client.delete("/api/v2/items/543efd13001e30837319/stock")
    # ```
    #
    def delete(path, params = {}, headers = {})
      process(:delete, path, params, headers)
    end

    private

    def connection
      @connection ||= Faraday.new(headers: DEFAULT_HEADERS, url: url_prefix) do |connection|
        connection.adapter Faraday.default_adapter
      end
    end

    def process(request_method, path, params, headers)
      Qiita::Response.new(connection.send(request_method, path, params, headers))
    end

    def url_prefix
      "https://#{@host}"
    end
  end
end
