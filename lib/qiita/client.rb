require 'faraday'
require 'faraday_middleware'
require 'faraday/response/raise_qiita_error.rb'
require 'json'
require 'qiita'
require 'qiita/error'
require 'qiita/client/items'
require 'qiita/client/tags'
require 'qiita/client/users'

module Qiita
  class Client
    ROOT_URL = 'https://qiita.com/'
    OPTIONS_KEYS = [:url_name, :password, :token].freeze

    attr_accessor *OPTIONS_KEYS

    def initialize(args)
      OPTIONS_KEYS.each do |key|
        send("#{key}=", args[key])
      end
      if token.nil? && url_name && password
        login
      end
    end

    def rate_limit params={}
      get '/rate_limit', params
    end

    include Qiita::Client::Items
    include Qiita::Client::Tags
    include Qiita::Client::Users

    private

    def login
      json = post '/auth', { :url_name => @url_name, :password => @password }
      @token = json['token']
    end

    def connection
      @connection ||= Faraday.new(:url => ROOT_URL) do |faraday|
        faraday.request :json
        faraday.adapter Faraday.default_adapter
        faraday.use Faraday::Response::RaiseQiitaError
        faraday.use FaradayMiddleware::Mashify
        faraday.use FaradayMiddleware::ParseJson
      end
    end

    def get(path, params={})
      request(:get, path, params)
    end

    def delete(path, params={})
      request(:delete, path, params)
    end

    def post(path, params={})
      request(:post, path, params)
    end

    def put(path, params={})
      request(:put, path, params)
    end

    def request(method, path, params)
      path = "/api/v1/#{path}"
      params.merge!(:token => token) if token
      response = connection.send(method) do |req|
        req.headers['Content-Type'] = 'application/json'
        case method
        when :get, :delete
          req.url path, params
        when :post, :put
          req.path = path
          req.body = params.to_json unless params.empty?
        end
      end
      response.body
    end
  end
end
