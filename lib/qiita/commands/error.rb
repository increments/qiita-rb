module Qiita
  module Commands
    class Error < Base
      def call
        abort(@arguments.error_message)
      end
    end
  end
end
