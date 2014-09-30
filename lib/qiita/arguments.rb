module Qiita
  class Arguments
    def initialize(argv)
      @argv = argv
    end

    def access_token
      slop_options["access-token"] || ENV["QIITA_ACCESS_TOKEN"]
    end

    def arguments
      parsed_argv_data[:arguments]
    end

    def color
      slop_options["color"]
    end

    def error_message
      slop_options.to_s
    end

    def headers
      parsed_argv_data[:headers]
    end

    def host
      slop_options["host"]
    end

    def method_name
      ARGV[0]
    end

    def params
      params_from_stdin.merge(parsed_argv_data[:params])
    end

    def show_body
      !slop_options["no-body"]
    end

    def show_header
      slop_options["header"]
    end

    def team
      slop_options["team"]
    end

    def valid?
      has_valid_slop_options? && has_valid_method_name? && has_valid_arguments? && !has_invalid_json_input?
    end

    private

    def has_input_from_stdin?
      has_pipe_input? || has_redirect_input?
    end

    def has_invalid_json_input?
      params_from_stdin
      false
    rescue JSON::ParserError
      true
    end

    def has_pipe_input?
      File.pipe?(STDIN)
    end

    def has_redirect_input?
      File.select([STDIN], [], [], 0) != nil
    end

    def has_valid_arguments?
      -(Client.instance_method(method_name).arity) - 1 == arguments.length
    end

    def has_valid_method_name?
      !method_name.nil? && Client.instance_methods.include?(method_name.to_sym)
    end

    def has_valid_slop_options?
      !slop_options["help"]
    rescue
      false
    end

    def params_from_stdin
      @params_from_stdin ||= begin
        if has_input_from_stdin?
          JSON.parse(STDIN.read)
        else
          {}
        end
      end
    end

    def parsed_argv_data
      @parsed_argv_data ||= begin
        params = {}
        headers = {}
        arguments = []
        ARGV[1..-1].each do |section|
          case
          when /(?<key>.+):(?<value>[^=]+)/ =~ section
            headers[key] = value
          when /(?<key>.+):=(?<value>.+)/ =~ section
            params[key] = JSON.parse(%<{"key":#{value}}>)["key"]
          when /(?<key>.+)=(?<value>.+)/ =~ section
            params[key] = value
          else
            arguments << section
          end
        end
        {
          arguments: arguments,
          headers: headers,
          params: params,
        }
      end
    end

    def slop_options
      @slop_options ||= Slop.parse!(@argv) do
        banner "Usage: qiita <method> [arguments] [headers|params] [options]"
        on "H", "host=", "Change API server's host"
        on "a", "access-token=", "Access token"
        on "c", "color", "Color output"
        on "h", "help", "Display help message"
        on "header", "Show response header"
        on "no-body", "Hide response body"
        on "t", "team=", "Team name to be used as subdomain"
      end
    end
  end
end
