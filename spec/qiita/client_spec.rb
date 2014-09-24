require "spec_helper"

describe Qiita::Client do
  def stub_api_request
    stub_request(request_method, requested_url).with(
      body: request_body,
      headers: requested_headers,
    ).to_return(
      body: response_body,
      headers: response_headers,
      status: status_code,
    )
  end

  let(:status_code) do
    200
  end

  let(:response_body) do
    response_hash.to_json
  end

  let(:response_hash) do
    { "dummy" => "dummy" }
  end

  let(:response_headers) do
    { "Content-Type" => "application/json" }
  end

  let(:requested_headers) do
    Qiita::Client::DEFAULT_HEADERS.clone
  end

  let(:request_body) do
    params.nil? || [:get, :delete].include?(request_method) ? nil : params
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
  end

  let(:headers) do
    {}
  end

  shared_examples_for "returns a Qiita::Response" do
    it "returns a Qiita::Response" do
      should be_a Qiita::Response
      subject.body.should eq response_hash
      subject.headers.should eq response_headers
      subject.status.should eq status_code
    end
  end

  shared_examples_for "valid condition" do
    context "with valid condition" do
      include_examples "returns a Qiita::Response"
    end
  end

  shared_examples_for "sends request with JSON-encoded body" do
    context "with params" do
      let(:params) do
        { key1: "value1", key2: "value2" }
      end

      it "sends request with JSON-encoded body" do
        should be_a Qiita::Response
      end
    end
  end

  shared_examples_for "sends request with URL query" do
    context "with params" do
      let(:params) do
        { key1: "value1", key2: "value2" }
      end

      let(:requested_url) do
        super() + "?key1=value1&key2=value2"
      end

      it "sends request with URL query" do
        should be_a Qiita::Response
      end
    end
  end

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
      stub_api_request
    end

    subject do
      client.get(*arguments)
    end

    let(:request_method) do
      :get
    end

    include_examples "valid condition"
    include_examples "sends request with URL query"

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

    context "with a Qiita::Client created with :access_token option" do
      before do
        options[:access_token] = access_token
      end

      let(:access_token) do
        "dummy-access-token"
      end

      let(:requested_headers) do
        super().merge("Authorization" => "Bearer #{access_token}")
      end

      it "sends request with configured access token" do
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
  end

  describe "#post" do
    before do
      stub_api_request
    end

    subject do
      client.post(*arguments)
    end

    let(:request_method) do
      :post
    end

    let(:status_code) do
      201
    end

    include_examples "valid condition"
    include_examples "sends request with JSON-encoded body"
  end

  describe "#patch" do
    before do
      stub_api_request
    end

    subject do
      client.patch(*arguments)
    end

    let(:request_method) do
      :patch
    end

    include_examples "valid condition"
    include_examples "sends request with JSON-encoded body"
  end

  describe "#put" do
    before do
      stub_api_request
    end

    subject do
      client.put(*arguments)
    end

    let(:request_method) do
      :put
    end

    let(:status_code) do
      204
    end

    include_examples "valid condition"
    include_examples "sends request with JSON-encoded body"
  end

  describe "#delete" do
    before do
      stub_api_request
    end

    subject do
      client.delete(*arguments)
    end

    let(:request_method) do
      :delete
    end

    let(:status_code) do
      204
    end

    include_examples "valid condition"
    include_examples "sends request with URL query"
  end
end
