# ## Qiita::CommandBuilder
# Creates a new command object from given ARGV.
#
# ```ruby
# builder = Qiita::CommandBuilder.new(ARGV)
# builder.call
# ```
#
module Qiita
  class CommandBuilder
    ### Qiita::CommandBuilder.new(argv)
    # Creates a new instance of Qiita::CommandBuilder from given command line arguments.
    #
    def initialize(argv)
      @argv = argv
    end

    ### Qiita::CommandBuilder#call
    # Returns a new instance of command class that inherited from Qiita::Commands::Base.
    #
    def call
      if arguments.valid?
        Qiita::Commands::Request.new(arguments)
      else
        Qiita::Commands::Error.new(arguments)
      end
    end

    private

    def arguments
      @arguments ||= Arguments.new(@argv)
    end
  end
end
