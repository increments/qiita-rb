module Qiita
  module Commands
    class Base
      def initialize(arguments)
        @arguments = arguments
      end

      def call
        raise NotImplementedError
      end
    end
  end
end
