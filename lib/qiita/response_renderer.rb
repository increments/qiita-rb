module Qiita
  class ResponseRenderer
    def initialize(response, color: nil, show_header: nil, show_body: nil)
      @response = response
      @color = color
      @show_body = show_body
      @show_header = show_header
    end

    def to_s
      template % {
        status: status,
        headers: headers,
        body: body,
      }
    end

    private

    def template
      str = ""
      str << <<-EOS.strip_heredoc if @show_header
        HTTP/1.1 %{status}
        %{headers}
      EOS
      if has_body? && @show_body
        str << "\n" if @show_header
        str << "%{body}"
      end
      str
    end

    def headers
      @response.headers.sort_by do |key, value|
        key
      end.map do |key, value|
        "%{key}: %{value}" % {
          key: Rainbow(key.split("-").map(&:camelize).join("-")).underline,
          value: Rainbow(value).green,
        }
      end.join("\n")
    end

    def status
      Rainbow("#{@response.status} #{@response.status_message}").bright
    end

    def body
      if @color
        Rouge::Formatters::Terminal256.format(
          Rouge::Lexers::Ruby.new.lex(plain_body),
          theme: "github"
        )
      else
        plain_body
      end
    end

    def plain_body
      if has_body?
        JSON.pretty_generate(@response.body) + "\n"
      else
        ""
      end
    end

    def Rainbow(str)
      if @color
        super
      else
        Rainbow::NullPresenter.new(str.to_s)
      end
    end

    def has_body?
      @response.status != 204
    end
  end
end
