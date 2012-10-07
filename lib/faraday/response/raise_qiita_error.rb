require 'faraday'

module Faraday
  class Response::RaiseQiitaError < Response::Middleware
    def on_complete(response)
      case response[:status]
      when 400
        raise Qiita::BadRequest, error_message(response)
      when 401
        raise Qiita::Unauthorized, error_message(response)
      when 403
        raise Qiita::Forbidden, error_message(response)
      when 404
        raise Qiita::NotFound, error_message(response)
      when 406
        raise Qiita::NotAcceptable, error_message(response)
      when 422
        raise Qiita::UnprocessableEntity, error_message(response)
      when 500
        raise Qiita::InternalServerError, error_message(response)
      when 501
        raise Qiita::NotImplemented, error_message(response)
      when 502
        raise Qiita::BadGateway, error_message(response)
      when 503
        raise Qiita::ServiceUnavailable, error_message(response)
      end
    end

    def error_message(response)
      message = JSON.parse(response[:body])['error']
      return message unless message.empty?
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:status]}"
    end
  end
end
