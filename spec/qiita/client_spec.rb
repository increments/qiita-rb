require "spec_helper"

describe Qiita::Client do
  describe ".new" do
    subject do
      described_class.new(*arguments)
    end

    let(:arguments) do
      [options]
    end

    let(:options) do
      {}
    end

    shared_examples_for "returns a Qiita::Client" do
      it "returns a Qiita::Client" do
        should be_a described_class
      end
    end

    context "without any arguments" do
      let(:arguments) do
        []
      end
      include_examples "returns a Qiita::Client"
    end

    context "with :access_token option" do
      let(:options) do
        { access_token: "dummy" }
      end
      include_examples "returns a Qiita::Client"
    end

    context "with :host option" do
      let(:options) do
        { host: "dummy" }
      end
      include_examples "returns a Qiita::Client"
    end
  end

  describe "#get" do
    before do
      stub_request(:get, requested_url).with(headers: requested_headers).to_return(
        headers: response_headers,
        status: status_code,
      )
    end

    subject do
      client.get(*arguments)
    end

    let(:status_code) do
      200
    end

    let(:response_headers) do
      { "Content-Type" => "application/json" }
    end

    let(:requested_headers) do
      {
        "Accept" => "*/*",
        "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
        "User-Agent" => Qiita::Client::DEFAULT_USER_AGENT,
      }
    end

    let(:requested_url) do
      "https://#{requested_host}#{path}"
    end

    let(:requested_host) do
      Qiita::Client::DEFAULT_HOST
    end

    let(:host) do
      Qiita::Client::DEFAULT_HOST
    end

    let(:client) do
      described_class.new(options)
    end

    let(:options) do
      {}
    end

    let(:arguments) do
      [path, params, headers]
    end

    let(:path) do
      "/api/v2/dummy"
    end

    let(:params) do
      {}
    end

    let(:headers) do
      {}
    end

    shared_examples_for "returns a Qiita::Response" do
      it "returns a Qiita::Response" do
        should be_a Qiita::Response
        subject.headers.should eq response_headers
        subject.status.should eq status_code
      end
    end

    context "with valid condition" do
      include_examples "returns a Qiita::Response"
    end

    context "without headers" do
      let(:arguments) do
        [path, params]
      end
      include_examples "returns a Qiita::Response"
    end

    context "without params nor headers" do
      let(:arguments) do
        [path]
      end
      include_examples "returns a Qiita::Response"
    end

    context "with a Qiita::Client created with :host option" do
      before do
        options[:host] = host
      end

      let(:host) do
        "example.com"
      end

      let(:requested_host) do
        host
      end

      it "sends request to configured host" do
        should be_a Qiita::Response
      end
    end

    context "with params" do
      let(:params) do
        { key1: "value1", key2: "value2" }
      end

      let(:requested_url) do
        super() + "?key1=value1&key2=value2"
      end

      it "sends request with URL query, encoded from given params" do
        should be_a Qiita::Response
      end
    end

    context "with headers" do
      let(:headers) do
        {
          "KEY1" => "value1",
          "KEY2" => "value2",
        }
      end

      let(:requested_headers) do
        super().merge(headers)
      end

      it "sends request with given headers" do
        should be_a Qiita::Response
      end
    end

    context "with headers duplicated with default headers" do
      let(:headers) do
        { "User-Agent" => "dummy" }
      end

      let(:requested_headers) do
        super().merge(headers)
      end

      it "sends request with overridden headers" do
        should be_a Qiita::Response
      end
    end
  end
end
