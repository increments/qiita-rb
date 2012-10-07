module Qiita
  class Error < StandardError; end
  class BadRequest < Error; end # 400
  class Unauthorized < Error; end # 401
  class Forbidden < Error; end    # 403
  class NotFound < Error; end     # 404
  class InternalServerError < Error; end # 500
end
