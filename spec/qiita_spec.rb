# coding: utf-8

require 'spec_helper'

describe Qiita do
  let(:url_name) { 'yaotti' }
  let(:uuid) { '1a43e55e7209c8f3c565' }
  let(:dummy_response) { mock(:response) }
  let(:dummy_params) { {} }

  describe '.rate_limit' do
    before do
      @client = Qiita::Client.new({})
      @client.should_receive(:get).
        with("/rate_limit", dummy_params).
        and_return(dummy_response)
      Qiita.stub!(:new => @client)
    end
    it { expect(Qiita.rate_limit(dummy_params)).to eq(dummy_response) }
  end

  describe 'Users' do
    describe '.user_items' do
      context 'w/ url_name' do
        before do
          @client = Qiita::Client.new({})
          @client.should_receive(:get).
            with("/users/#{url_name}/items", dummy_params).
            and_return(dummy_response)
          Qiita.stub!(:new => @client)
        end
        it { expect(Qiita.user_items(url_name, dummy_params)).to eq(dummy_response) }
      end

      context 'w/o url_name' do
        before do
          @client = Qiita::Client.new({})
          @client.should_receive(:get).
            with("/items", dummy_params).
            and_return(dummy_response)
          Qiita.stub!(:new => @client)
        end
        it { expect(Qiita.user_items(nil, dummy_params)).to eq(dummy_response) }
      end
    end

    describe '.user_stocks' do
      context 'w/ url_name' do
        before do
          @client = Qiita::Client.new({})
          @client.should_receive(:get).
            with("/users/#{url_name}/stocks", dummy_params).
            and_return(dummy_response)
          Qiita.stub!(:new => @client)
        end
        it { expect(Qiita.user_stocks(url_name, dummy_params)).to eq(dummy_response) }
      end

      context 'w/o url_name' do
        before do
          @client = Qiita::Client.new({})
          @client.should_receive(:get).
            with("/stocks", dummy_params).
            and_return(dummy_response)
          Qiita.stub!(:new => @client)
        end
        it { expect(Qiita.user_stocks(nil, dummy_params)).to eq(dummy_response) }
      end
    end
  end

  describe 'Tags' do
    describe '.tag_items' do
      before do
        @client = Qiita::Client.new({})
        @client.should_receive(:get).
          with("/tags/#{url_name}/items", dummy_params).
          and_return(dummy_response)
        Qiita.stub!(:new => @client)
      end
      it { expect(Qiita.tag_items(url_name, dummy_params)).to eq(dummy_response) }
    end

    describe '.tags' do
      before do
        @client = Qiita::Client.new({})
        @client.should_receive(:get).
          with("/tags", dummy_params).
          and_return(dummy_response)
        Qiita.stub!(:new => @client)
      end
      it { expect(Qiita.tags(dummy_params)).to eq(dummy_response) }
    end
  end

  describe 'Items' do
    describe '.post_item' do
      before do
        @client = Qiita::Client.new({})
        @client.should_receive(:post).
          with("/items", dummy_params).
          and_return(dummy_response)
        Qiita.stub!(:new => @client)
      end
      it { expect(Qiita.post_item(dummy_params)).to eq(dummy_response) }
    end

    describe '.update_item' do
      before do
        @client = Qiita::Client.new({})
        @client.should_receive(:put).
          with("/items/#{uuid}", dummy_params).
          and_return(dummy_response)
        Qiita.stub!(:new => @client)
      end
      it { expect(Qiita.update_item(uuid, dummy_params)).to eq(dummy_response) }
    end

    describe '.delete_item' do
      before do
        @client = Qiita::Client.new({})
        @client.should_receive(:delete).
          with("/items/#{uuid}").
          and_return(dummy_response)
        Qiita.stub!(:new => @client)
      end
      it { expect(Qiita.delete_item(uuid)).to eq(dummy_response) }
    end

    describe '.item' do
      before do
        @client = Qiita::Client.new({})
        @client.should_receive(:get).
          with("/items/#{uuid}").
          and_return(dummy_response)
        Qiita.stub!(:new => @client)
      end
      it { expect(Qiita.item(uuid)).to eq(dummy_response) }
    end

    describe '.search_items' do
      before do
        @query = 'cat'
        @client = Qiita::Client.new({})
        @client.should_receive(:get).
          with("/search", dummy_params.merge(q: @query)).
          and_return(dummy_response)
        Qiita.stub!(:new => @client)
      end
      it { expect(Qiita.search_items(@query, dummy_params)).to eq(dummy_response) }
    end

    describe '.stock_item' do
      before do
        @query = 'cat'
        @client = Qiita::Client.new({})
        @client.should_receive(:put).
          with("/items/#{uuid}/stock").
          and_return(dummy_response)
        Qiita.stub!(:new => @client)
      end
      it { expect(Qiita.stock_item(uuid)).to eq(dummy_response) }
    end

    describe '.unstock_item' do
      before do
        @query = 'cat'
        @client = Qiita::Client.new({})
        @client.should_receive(:delete).
          with("/items/#{uuid}/stock").
          and_return(dummy_response)
        Qiita.stub!(:new => @client)
      end
      it { expect(Qiita.unstock_item(uuid)).to eq(dummy_response) }
    end
  end
end

