require 'faraday'
require 'faraday_middleware'
require 'faraday/response/raise_qiita_error.rb'
require 'json'
require 'qiita'
require 'qiita/error'

module Qiita
  class Client
    ROOT_URL = 'https://qiita.com/api/v1'
    OPTION_KEYS = [:url_name, :password, :token].freeze

    attr_accessor *OPTION_KEYS

    def initialize(args)
      OPTION_KEYS.each do |key|
        send("#{key}=", args[key])
      end
      login if token.nil?
    end

    private

    def login
      response = connection.post do |req|
        req.url '/api/v1/auth'
        req.headers['Content-Type'] = 'application/json'
        req.body = { :url_name => @url_name, :password => @password }.to_json
      end
      @token = JSON.parse(response.body)['token']
    end

    def connection
      @connection ||= Faraday.new(:url => ROOT_URL) do |faraday|
        faraday.request :json
        faraday.adapter  Faraday.default_adapter
        faraday.use Faraday::Response::RaiseQiitaError
      end
    end
  end
end
